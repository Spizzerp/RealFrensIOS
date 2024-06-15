import UIKit
import SwiftUI
import MapboxMaps
import CoreLocation

// MARK: - Map1 Class
/// Map1 is a UIViewController subclass that integrates with MapboxMaps to display a map with annotations.
class Map1: UIViewController, CLLocationManagerDelegate {
    // MARK: - Properties
    var mapView: MapView!
    var pointAnnotationManager: PointAnnotationManager?
    var locationManager = CLLocationManager()
    var selectedAnnotation: PointAnnotation?
    var annotationsDictionary: [String: (annotation: PointAnnotation, album: Album)] = [:]

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()

        setupMapView()
        setupLocationManager()
        setupNotifications()
        setupPlaceholderPins()
    }

    // MARK: - Setup Methods
    private func setupMapView() {
        mapView = MapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        mapView.mapboxMap.loadStyle(StyleURI(rawValue: "mapbox://styles/spizzerp/clv5lbn0200jp01ocghqwc62q")!)
        pointAnnotationManager = mapView.annotations.makePointAnnotationManager()

        mapView.ornaments.scaleBarView.isHidden = true
        mapView.ornaments.logoView.isHidden = true
        mapView.ornaments.attributionButton.isHidden = true
        mapView.ornaments.compassView.isHidden = true

        let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), zoom: 0)
        mapView.mapboxMap.setCamera(to: cameraOptions)

        view.addSubview(mapView)
    }

    private func setupLocationManager() {
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()
    }

    private func setupNotifications() {
        NotificationCenter.default.addObserver(self, selector: #selector(addPinAtUserLocation), name: .addPin, object: nil)
    }

    private func setupPlaceholderPins() {
        addPin(coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), identifier: "NewYork", album: Album(id: 1, title: "New York", coverImage: "mock1.png", images: ["mock1", "mock2"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey."))
        addPin(coordinate: CLLocationCoordinate2D(latitude: 48.8566, longitude: 2.3522), identifier: "Paris", album: Album(id: 2, title: "Paris", coverImage: "mock2.png", images: ["mock3", "mock4"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey."))
        addPin(coordinate: CLLocationCoordinate2D(latitude: 35.6895, longitude: 139.6917), identifier: "Japan", album: Album(id: 3, title: "Japan", coverImage: "mock3.png", images: ["mock3", "mock2"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey."))
        addPin(coordinate: CLLocationCoordinate2D(latitude: 15.8700, longitude: 100.9925), identifier: "Thailand", album: Album(id: 4, title: "Thailand", coverImage: "mock1.png", images: ["mock1", "mock2"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey."))
    }

    // MARK: - Annotation Methods
    func addPin(coordinate: CLLocationCoordinate2D, identifier: String, album: Album) {
        var pointAnnotation = PointAnnotation(coordinate: coordinate)
        if let image = UIImage(named: "Pinuser.png")?.resizeImage(to: CGSize(width: 60, height: 60)) {
            pointAnnotation.image = .init(image: image, name: "Pinuser")
        } else {
            pointAnnotation.iconColor = StyleColor(UIColor.red)
        }

        pointAnnotation.tapHandler = { [weak self] annotation in
            self?.presentAlbumView(for: identifier)
            return true
        }

        annotationsDictionary[identifier] = (pointAnnotation, album)
        pointAnnotationManager?.annotations.append(pointAnnotation)
    }

    func presentAlbumView(for identifier: String) {
        guard let annotationData = annotationsDictionary[identifier] else { return }
        let album = annotationData.album
        let albumView = AlbumView(album: album)
        let hostingController = UIHostingController(rootView: albumView)
        hostingController.modalPresentationStyle = .fullScreen
        present(hostingController, animated: true, completion: nil)
    }

    // MARK: - Location Methods
    @objc func addPinAtUserLocation() {
        if let currentLocation = locationManager.location?.coordinate {
            let defaultAlbum = Album(id: 5, title: "Default Album", coverImage: "default_cover", images: ["default1", "default2"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey.")
            addPin(coordinate: currentLocation, identifier: UUID().uuidString, album: defaultAlbum)
            animateToLocation(currentLocation)
        }
    }

    // MARK: - Camera Methods
    func animateToLocation(_ coordinates: CLLocationCoordinate2D) {
        let cameraOptions = CameraOptions(center: coordinates, zoom: 14.0)
        mapView.camera.ease(to: cameraOptions, duration: 2.0)
    }
}

// MARK: - Map1Wrapper
/// Map1Wrapper is a UIViewControllerRepresentable wrapper for Map1 to be used in SwiftUI.
struct Map1Wrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Map1 {
        return Map1()
    }

    func updateUIViewController(_ uiViewController: Map1, context: Context) {
        // Placeholder for updating the view controller, if needed
    }
}

// MARK: - Notification Extension
extension Notification.Name {
    static let addPin = Notification.Name("addPin")
}

// MARK: - UIImage Extension
extension UIImage {
    func resizeImage(to size: CGSize) -> UIImage? {
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        defer { UIGraphicsEndImageContext() }
        self.draw(in: CGRect(origin: .zero, size: size))
        return UIGraphicsGetImageFromCurrentImageContext()
    }
}
