import UIKit
import SwiftUI
import MapboxMaps
import CoreLocation

class Map1: UIViewController, CLLocationManagerDelegate {
    var mapView: MapView!
    var pointAnnotationManager: PointAnnotationManager?
    var locationManager = CLLocationManager()
    var selectedAnnotation: PointAnnotation?
    var annotationsDictionary: [String: PointAnnotation] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()

        // Define padding for top and bottom only, removing horizontal padding
            let verticalPadding: CGFloat = 100
            let newFrame = CGRect(
                x: 0, // Start from the very left side of the view
                y: view.safeAreaLayoutGuide.layoutFrame.minY + verticalPadding, // Apply vertical padding at the top
                width: view.bounds.width, // Use the full width of the view
                height: view.safeAreaLayoutGuide.layoutFrame.height - (verticalPadding * 2) // Apply vertical padding at the top and bottom
            )

        // Initialize the MapView with the adjusted frame
        mapView = MapView(frame: newFrame)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Set your custom style URL here
        mapView.mapboxMap.loadStyle(StyleURI(rawValue: "mapbox://styles/spizzerp/cltg9fc3f00vm01oigpw177zy")!)

        pointAnnotationManager = mapView.annotations.makePointAnnotationManager()

        // CLLocationManager setup remains the same
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        // Hide default Mapbox UI elements
        mapView.ornaments.scaleBarView.isHidden = true
        mapView.ornaments.logoView.isHidden = true
        mapView.ornaments.attributionButton.isHidden = true
        mapView.ornaments.compassView.isHidden = true

        // Initial camera setting
        let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), zoom: 0)
        mapView.mapboxMap.setCamera(to: cameraOptions)

        // Apply the glowing border to the mapView's layer
        mapView.layer.masksToBounds = false
        mapView.layer.shadowColor = UIColor.systemBlue.cgColor // Glowing border color
        mapView.layer.shadowRadius = 10 // Glowing border radius
        mapView.layer.shadowOpacity = 0.9 // Glowing border opacity
        mapView.layer.shadowOffset = CGSize.zero // Center the glow

        view.addSubview(mapView)

        // Observers and gesture recognizers setup
        NotificationCenter.default.addObserver(self, selector: #selector(addPinAtUserLocation), name: .addPin, object: nil)
        setupPinGestureRecognizers()
    }

    @objc func addPinAtUserLocation() {
        if let currentLocation = locationManager.location?.coordinate {
            var pointAnnotation = PointAnnotation(coordinate: currentLocation)
            if let image = UIImage(named: "marker") {
                pointAnnotation.image = .init(image: image, name: "marker")
            } else {
                pointAnnotation.iconColor = StyleColor(UIColor.red)
            }

            // Generate a unique identifier for the annotation
            let identifier = UUID().uuidString

            // Print the identifier for debugging purposes
            print("Added new pin with identifier: \(identifier)")

            // Store the annotation in the dictionary with its identifier
            annotationsDictionary[identifier] = pointAnnotation

            // Add the annotation to the pointAnnotationManager
            pointAnnotationManager?.annotations.append(pointAnnotation)

            // Optionally animate the map view to the location of the new pin
            animateToLocation(currentLocation)
        }
    }

    func setupPinGestureRecognizers() {
        // Placeholder for adding gesture recognizers to existing pins if any
    }

    @objc func handleLongPressOnPin(_ gesture: UILongPressGestureRecognizer) {
        // Placeholder for handling long press on pin
    }

    func updatePinLocation() {
        // Placeholder for updating the location of the moved pin
    }

    func deletePin(at coordinate: CLLocationCoordinate2D) {
        // Placeholder for deleting the pin
    }

    func animateToLocation(_ coordinates: CLLocationCoordinate2D) {
        let cameraOptions = CameraOptions(center: coordinates, zoom: 14.0)
        mapView.camera.ease(to: cameraOptions, duration: 2.0)
    }
}

struct Map1Wrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Map1 {
        return Map1()
    }

    func updateUIViewController(_ uiViewController: Map1, context: Context) {
        // Placeholder for updating the view controller, if needed
    }
}

extension Notification.Name {
    static let addPin = Notification.Name("addPin")
}
