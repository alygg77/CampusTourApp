import SwiftUI

struct MapView: View {
    @State private var searchText = ""
    @State private var zoomLevel: Float = 6.0

    var body: some View {
        ZStack {
            Color(red: 0.086, green: 0.086, blue: 0.086)
                .edgesIgnoringSafeArea(.all)
            VStack {
                MapsSearchBar(text: $searchText)
                GoogleMapView(zoomLevel: $zoomLevel)
                    .frame(height: UIScreen.main.bounds.height / 2)
                Spacer()
            }
            VStack {
                Spacer()
                HStack {
                    Button(action: {
                        zoomLevel += 1
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                    Button(action: {
                        zoomLevel -= 1
                    }) {
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .clipShape(Circle())
                    }
                }
                .padding()
            }
        }
    }
}




struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
