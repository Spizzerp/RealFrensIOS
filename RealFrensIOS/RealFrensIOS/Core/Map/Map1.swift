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

        // Initialize the MapView to fill the safe area of the screen
        mapView = MapView(frame: view.safeAreaLayoutGuide.layoutFrame)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        pointAnnotationManager = mapView.annotations.makePointAnnotationManager()

        // CLLocationManager setup
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startUpdatingLocation()

        // Hide the scale bar and Mapbox logo/attribution
        mapView.ornaments.scaleBarView.isHidden = true
        mapView.ornaments.logoView.isHidden = true
        mapView.ornaments.attributionButton.isHidden = true
        mapView.ornaments.compassView.isHidden = true

        // Set initial camera settings
        let cameraOptions = CameraOptions(center: CLLocationCoordinate2D(latitude: 0, longitude: 0), zoom: 0)
        mapView.mapboxMap.setCamera(to: cameraOptions)

        view.addSubview(mapView)

        // Notification for adding a pin
        NotificationCenter.default.addObserver(self, selector: #selector(addPinAtUserLocation), name: .addPin, object: nil)
        
        // Setup for pin movement (this is a placeholder and needs specific implementation)
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

    // Setup gesture recognizers for pins (Placeholder)
    func setupPinGestureRecognizers() {
        // Add gesture recognizers to existing pins if any
    }

    @objc func handleLongPressOnPin(_ gesture: UILongPressGestureRecognizer) {
        switch gesture.state {
        case .began:
            print("Long press began") // Placeholder
            // Implement logic to identify and start moving the pin
        case .changed:
            print("Long press location changed") // Placeholder
            // Implement logic to update the pin's location as it moves
        case .ended:
            print("Long press ended") // Placeholder
            updatePinLocation()
        default:
            break
        }
    }

    func updatePinLocation() {
        // Logic to update the location of the moved pin
    }

    func deletePin(at coordinate: CLLocationCoordinate2D) {
        // Logic to delete the pin
    }

    // CLLocationManagerDelegate methods...
    // ... existing delegate methods ...

    func animateToLocation(_ coordinates: CLLocationCoordinate2D) {
        let cameraOptions = CameraOptions(center: coordinates, zoom: 14.0)
        mapView.camera.ease(to: cameraOptions, duration: 2.0)
    }
}

struct Map1Wrapper: UIViewControllerRepresentable {
    func makeUIViewController(context: Context) -> Map1 {
        return Map1()
    }
    func updateUIViewController(_ uiViewController: Map1, context: Context) {}
}

extension Notification.Name {
    static let addPin = Notification.Name("addPin")
}
