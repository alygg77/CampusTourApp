import SwiftUI
import Firebase

struct UniversityView: View {
    @ObservedObject private var viewModel = UniversityViewModel()
    @State private var searchText = ""
    @State private var isSearchBarVisible = false
    @State private var isInfoButtonPressed = false

    var body: some View {
        ZStack {
            Color(red: 0.086, green: 0.086, blue: 0.09)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                if isSearchBarVisible {
                    SearchBar(text: $searchText, isEditing: $isSearchBarVisible)
                        .padding(.horizontal)
                } else {
                    HStack {
                        Button(action: {
                            isInfoButtonPressed = true
                        }) {
                            Image(systemName: "info.circle")
                                .foregroundColor(.white)
                                .font(.title3)
                        }
                        .sheet(isPresented: $isInfoButtonPressed) {
                            InfoView()
                        }
                        Spacer()
                        
                        Text("Rankings")
                            .font(.title)
                            .foregroundColor(Color.white)
                            .fontWeight(.semibold)
                        Spacer()
                        
                        Button(action: {
                            isSearchBarVisible = true
                        }) {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white)
                                .font(.body)
                        }
                    }
                    .padding(.horizontal)
                }
                
                Divider()
                    .background(Color.white)
                    .frame(height: 3)
                    .padding(.vertical, -10)
                
                ScrollView{
                    LazyVStack {
                        ForEach(viewModel.universities.filter { searchText.isEmpty || $0.name.contains(searchText) }.sorted { Int($0.rank) ?? 0 < Int($1.rank) ?? 0 }, id: \.name) { university in
                            UniversityRowView(university: university)
                        }
                    }
                }
                .padding(.vertical, -15)
            }
        }
        .onAppear() {
            self.viewModel.fetchData()
        }
    }
}



