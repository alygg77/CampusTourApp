import Foundation


struct University: Identifiable, Codable {
    var id: String
    var name: String
    var availableDates: [String]
    var averageCost: String
    var endowment: String
    var location: String
    var rank: String
    var rate: String
    var website: String
    
    init(id: String, name: String, rank: String, location: String, rate: String, endowment: String, averageCost: String, website: String, availableDates: Any) {
        self.id = id
        self.name = name
        self.rank = rank
        self.location = location
        self.rate = rate
        self.endowment = endowment
        self.averageCost = averageCost
        self.website = website
        
        if let availableDatesString = availableDates as? String, availableDatesString == "check" {
            self.availableDates = ["No Data"]
        } else if let availableDatesArray = availableDates as? [String], availableDatesArray.isEmpty {
            self.availableDates = ["None"]
        } else if let availableDatesArray = availableDates as? [String] {
            self.availableDates = availableDatesArray
        } else {
            self.availableDates = ["Unknown"]
        }
    }
}




