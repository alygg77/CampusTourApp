import SwiftUI

struct MapsSearchBar: View {
    @Binding var text: String

    var body: some View {
        TextField("Search", text: $text)
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)
    }
}



