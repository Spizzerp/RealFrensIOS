import UIKit
import SwiftUI
import MapboxMaps
import CoreLocation

class Map2: UIViewController, CLLocationManagerDelegate {
    var mapView: MapView!
    var pointAnnotationManager: PointAnnotationManager?
    var locationManager = CLLocationManager()
    var friendsAnnotations: [String: PointAnnotation] = [:] // Store friends' locations differently if needed

    override func viewDidLoad() {
        super.viewDidLoad()

        // Adjust frame for MapView to match desired UI layout
        let verticalPadding: CGFloat = 100
        let newFrame = CGRect(
            x: 0, // Utilize full width
            y: view.safeAreaLayoutGuide.layoutFrame.minY + verticalPadding,
            width: view.bounds.width,
            height: view.safeAreaLayoutGuide.layoutFrame.height - (verticalPadding * 2)
        )

        // Initialize the MapView with the adjusted frame
        mapView = MapView(frame: newFrame)
        mapView.autoresizingMask = [.flexibleWidth, .flexibleHeight]

        // Example: Load a different style for "Frens World"
        mapView.mapboxMap.loadStyle(StyleURI(rawValue: "mapbox://styles/spizzerp/cltroyn0w01iu01oi5wfhdr2o")!)

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

        // Apply a glowing border if desired
        mapView.layer.masksToBounds = false
        mapView.layer.shadowColor = UIColor.systemPurple.cgColor // Adjust color for "Frens World"
        mapView.layer.shadowRadius = 10
        mapView.layer.shadowOpacity = 0.9
        mapView.layer.shadowOffset = CGSize.zero

        view.addSubview(mapView)

        // Setup observers and gesture recognizers as needed for "Frens World"
        NotificationCenter.default.addObserver(self, selector: #selector(addFriendLocation), name: .addFriendLocation, object: nil)
        setupGestureRecognizersForFriends()
    }

    @objc func addFriendLocation() {
        // Implement logic to add friends' locations as annotations
    }

    func setupGestureRecognizersForFriends() {
        // Placeholder for adding gesture recognizers specific to friends' pins
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
}

extension Notification.Name {
    // Define a new notification name for adding friend locations
    static let addFriendLocation = Notification.Name("addFriendLocation")
}
