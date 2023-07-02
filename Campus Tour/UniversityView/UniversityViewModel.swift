import Firebase
import SwiftUI

class UniversityViewModel: ObservableObject {
    @Published var universities = [University]()
    private var db = Firestore.firestore()

    func fetchData() {
        db.collection("universities").addSnapshotListener { (querySnapshot, error) in
            guard let documents = querySnapshot?.documents else {
                print("No documents")
                return
            }

            self.universities = documents.map { (queryDocumentSnapshot) -> University in
                let data = queryDocumentSnapshot.data()
                let id = data["id"] as? String ?? ""
                let name = queryDocumentSnapshot.documentID
                let availableDates = data["available_dates"] as? [String] ?? [String]()
                let averageCost = data["averagecost"] as? String ?? ""
                let endowment = data["endowment"] as? String ?? ""
                let location = data["location"] as? String ?? ""
                let rank = data["rank"] as? String ?? ""
                let rate = data["rate"] as? String ?? ""
                let website = data["website"] as? String ?? ""
                return University(id: id, name: name, rank: rank, location: location, rate: rate, endowment: endowment, averageCost: averageCost, website: website, availableDates: availableDates)
            }

        }
    }

}


