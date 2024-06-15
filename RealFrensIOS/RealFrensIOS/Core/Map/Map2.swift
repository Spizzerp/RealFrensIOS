import UIKit
import SwiftUI
import MapboxMaps
import CoreLocation

// MARK: - Map2 Class
/// Map2 is a UIViewController subclass that integrates with MapboxMaps to display a map with event annotations.
class Map2: UIViewController, CLLocationManagerDelegate {
    // MARK: - Properties
    var mapView: MapView!
    var pointAnnotationManager: PointAnnotationManager?
    var locationManager = CLLocationManager()
    var friendsAnnotations: [String: PointAnnotation] = [:]
    var annotationsDictionary: [String: Event] = [:]

    // MARK: - Lifecycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        setupMapView()
        setupLocationManager()
        setupNotifications()
        setupGestureRecognizersForFriends()
        defineSampleEvents()
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
        NotificationCenter.default.addObserver(self, selector: #selector(addFriendLocation), name: .addFriendLocation, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleEventSelection(notification:)), name: .eventSelected, object: nil)
    }

    private func defineSampleEvents() {
        let nycEvent = Event(id: 1, title: "Bonking in NYC", location: "NYC", time: "6:00 PM", date: Date(), images: ["mock4", "Bonkmock1", "Bonkmock2", "Bonkmock3", "Bonkmock4"])
        let sgpEvent = Event(id: 2, title: "Solana Breakpoint", location: "SGP", time: "8:00 PM", date: Date(), images: ["Mocksgp1", "Mocksgp2", "Mocksgp3"])
        addPinAnnotation(imageName: "Pinbonk", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), event: nycEvent)
        addPinAnnotation(imageName: "Pinsol", coordinate: CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198), event: sgpEvent)
    }

    // MARK: - Annotation Methods
    private func addPinAnnotation(imageName: String, coordinate: CLLocationCoordinate2D, event: Event) {
        if let image = UIImage(named: imageName) {
            let size = CGSize(width: 60, height: 60)
            let resizedImage = resizeImage(image: image, targetSize: size)
            var pinAnnotation = PointAnnotation(coordinate: coordinate)
            pinAnnotation.image = .init(image: resizedImage, name: imageName)
            pinAnnotation.iconAnchor = .bottom

            pinAnnotation.tapHandler = { [weak self] annotation in
                self?.presentEventView(event: event)
                return true
            }

            pointAnnotationManager?.annotations.append(pinAnnotation)
            annotationsDictionary[imageName] = event
        }
    }

    private func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
        let size = image.size
        let widthRatio = targetSize.width / size.width
        let heightRatio = targetSize.height / size.height
        let scaleFactor = min(widthRatio, heightRatio)
        let scaledSize = CGSize(width: size.width * scaleFactor, height: size.height * scaleFactor)
        let renderer = UIGraphicsImageRenderer(size: scaledSize)
        let scaledImage = renderer.image { _ in
            image.draw(in: CGRect(origin: .zero, size: scaledSize))
        }
        return scaledImage
    }

    // MARK: - Event Handling Methods
    @objc private func handleEventSelection(notification: Notification) {
        if let imageName = notification.object as? String {
            bringEventToFront(imageName: imageName)
        }
    }

    private func bringEventToFront(imageName: String) {
        let targetCoordinate: CLLocationCoordinate2D
        switch imageName {
        case "Pinbonk":
            targetCoordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060)
        case "Pinsol":
            targetCoordinate = CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198)
        default:
            return
        }

        let cameraOptions = CameraOptions(center: targetCoordinate, zoom: 10)
        animateCamera(to: cameraOptions)
    }

    private func animateCamera(to cameraOptions: CameraOptions) {
        let cameraAnimator = UIViewPropertyAnimator(duration: 2.0, timingParameters: UICubicTimingParameters(animationCurve: .easeInOut))
        cameraAnimator.addAnimations { [weak self] in
            self?.mapView.camera.ease(to: cameraOptions, duration: 2.0)
        }
        cameraAnimator.startAnimation()
    }

    // MARK: - Friend Location Methods
    @objc private func addFriendLocation() {
        // Implement logic to add friends' locations as annotations
    }

    private func setupGestureRecognizersForFriends() {
        // Placeholder for adding gesture recognizers specific to friends' pins
    }

    private func presentEventView(event: Event) {
        let eventView = EventView(event: event)
        let hostingController = UIHostingController(rootView: eventView)
        hostingController.modalPresentationStyle = .fullScreen
        present(hostingController, animated: true, completion: nil)
    }
}

// MARK: - Map2Wrapper
/// Map2Wrapper is a UIViewControllerRepresentable wrapper for Map2 to be used in SwiftUI.
struct Map2Wrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Map2 {
        return Map2()
    }

    func updateUIViewController(_ uiViewController: Map2, context: Context) {
        // Update logic if needed
    }

    func handleEventSelection() {
        // Perform any additional logic to locate the event pin on the map
    }
}

// MARK: - Notification Extension
extension Notification.Name {
    static let addFriendLocation = Notification.Name("addFriendLocation")
}
