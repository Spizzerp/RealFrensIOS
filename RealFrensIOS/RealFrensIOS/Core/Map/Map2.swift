import UIKit
import SwiftUI
import MapboxMaps
import CoreLocation

class Map2: UIViewController, CLLocationManagerDelegate {
    var mapView: MapView!
    var pointAnnotationManager: PointAnnotationManager?
    var locationManager = CLLocationManager()
    var friendsAnnotations: [String: PointAnnotation] = [:] // Store friends' locations differently if needed
    var annotationsDictionary: [String: Event] = [:] // Store events associated with annotations

    override func viewDidLoad() {
        super.viewDidLoad()

        // Initialize the MapView with the view's bounds
        mapView = MapView(frame: view.bounds)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Example: Load a different style for "Frens World"
        mapView.mapboxMap.loadStyle(StyleURI(rawValue: "mapbox://styles/spizzerp/clv5lbn0200jp01ocghqwc62q")!)

        pointAnnotationManager = mapView.annotations.makePointAnnotationManager()

        // Setup location manager
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        // Customize MapView appearance and hide default UI elements
        mapView.ornaments.scaleBarView.isHidden = true
        mapView.ornaments.logoView.isHidden = true
        mapView.ornaments.attributionButton.isHidden = true
        mapView.ornaments.compassView.isHidden = true

        // Adjust initial camera settings if needed
        let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), zoom: 0)
        mapView.mapboxMap.setCamera(to: cameraOptions)

        view.addSubview(mapView)

        // Setup observers and gesture recognizers as needed for "Frens World"
        NotificationCenter.default.addObserver(self, selector: #selector(addFriendLocation), name: .addFriendLocation, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(handleEventSelection(notification:)), name: .eventSelected, object: nil)
        setupGestureRecognizersForFriends()

        // Define some sample events
        let nycEvent = Event(id: 1, title: "Bonk Event", location: "NYC", time: "6:00 PM", date: Date(), images: ["mock4"])
        let sgpEvent = Event(id: 2, title: "Solana Breakpoint", location: "SGP", time: "8:00 PM", date: Date(), images: ["Mocksgp1", "Mocksgp2", "Mocksgp3"])

        // Add Pinbonk.png and Pinsol.png as pins with event details
        addPinAnnotation(imageName: "Pinbonk", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060), event: nycEvent)
        addPinAnnotation(imageName: "Pinsol", coordinate: CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198), event: sgpEvent)
    }

    func addPinAnnotation(imageName: String, coordinate: CLLocationCoordinate2D, event: Event) {
        if let image = UIImage(named: imageName) {
            let size = CGSize(width: 60, height: 60) // Adjust the size as needed
            let resizedImage = resizeImage(image: image, targetSize: size)
            var pinAnnotation = PointAnnotation(coordinate: coordinate)
            pinAnnotation.image = .init(image: resizedImage, name: imageName)

            // Set the anchor point for the pin annotation
            pinAnnotation.iconAnchor = .bottom

            // Add tap handler to the annotation
            pinAnnotation.tapHandler = { [weak self] annotation in
                self?.presentEventView(event: event)
                return true
            }

            pointAnnotationManager?.annotations.append(pinAnnotation)
            annotationsDictionary[imageName] = event
        }
    }

    func resizeImage(image: UIImage, targetSize: CGSize) -> UIImage {
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

    @objc func handleEventSelection(notification: Notification) {
        if let imageName = notification.object as? String {
            bringEventToFront(imageName: imageName)
        }
    }

    func bringEventToFront(imageName: String) {
        let targetCoordinate: CLLocationCoordinate2D

        switch imageName {
        case "Pinbonk":
            targetCoordinate = CLLocationCoordinate2D(latitude: 40.7128, longitude: -74.0060) // New York City
        case "Pinsol":
            targetCoordinate = CLLocationCoordinate2D(latitude: 1.3521, longitude: 103.8198) // Singapore
        default:
            return
        }

        let cameraOptions = CameraOptions(center: targetCoordinate, zoom: 10)
        animateCamera(to: cameraOptions)
    }

    func animateCamera(to cameraOptions: CameraOptions) {
        let cameraAnimator = UIViewPropertyAnimator(duration: 2.0, timingParameters: UICubicTimingParameters(animationCurve: .easeInOut))
        cameraAnimator.addAnimations { [weak self] in
            self?.mapView.camera.ease(to: cameraOptions, duration: 2.0)
        }
        cameraAnimator.startAnimation()
    }

    @objc func addFriendLocation() {
        // Implement logic to add friends' locations as annotations
    }

    func setupGestureRecognizersForFriends() {
        // Placeholder for adding gesture recognizers specific to friends' pins
    }

    func presentEventView(event: Event) {
        let eventView = EventView(event: event)
        let hostingController = UIHostingController(rootView: eventView)
        hostingController.modalPresentationStyle = .fullScreen
        present(hostingController, animated: true, completion: nil)
    }

    // Implement additional functionalities specific to "Frens World"
    // ...

    // Continue with the rest of the Map1 functionalities adapted for Map2
}

// Implement UIViewControllerRepresentable for SwiftUI compatibility
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

extension Notification.Name {
    // Define a new notification name for adding friend locations
    static let addFriendLocation = Notification.Name("addFriendLocation")
}
