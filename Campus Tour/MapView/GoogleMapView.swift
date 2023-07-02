import SwiftUI
import GoogleMaps

struct GoogleMapView: UIViewRepresentable {
    @Binding var zoomLevel: Float

    func makeUIView(context: Context) -> GMSMapView {
        let camera = GMSCameraPosition.camera(withLatitude: 40.748817, longitude: -73.985428, zoom: zoomLevel)
        let mapView = GMSMapView.map(withFrame: CGRect.zero, camera: camera)
        return mapView
    }

    func updateUIView(_ uiView: GMSMapView, context: Context) {
        let camera = GMSCameraPosition.camera(withLatitude: 40.748817, longitude: -73.985428, zoom: zoomLevel)
        uiView.camera = camera
    }
}

