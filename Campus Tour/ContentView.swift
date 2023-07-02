import CoreData
import SwiftUI

struct ContentView: View {
    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(Color(red: 0.086, green:0.086, blue: 0.086))
        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
    }
    
    var body: some View {
        TabView {
            UniversityView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Ranking")
                }
            
            MapView()
                .tabItem {
                    Image(systemName: "map")
                    Text("Map")
                }
            
            Text("Calendar")
                .tabItem {
                    Image(systemName: "calendar")
                    Text("Calendar")
                }
        }
        .accentColor(Color(red: 0.87, green: 0.92, blue:1))
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


