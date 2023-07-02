import SwiftUI



struct UniversityRowView: View {
    var university: University
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 25, style: .continuous)
                .fill(bey)
            
            VStack(alignment: .leading) {
                HStack {
                    Text(university.name)
                        .fontWeight(.semibold)
                        .font(.system(size:17))
                        .foregroundColor(Color.white)
                        .tracking(1)
                    Spacer()
                    
                    Text("#\(university.rank)")
                        .fontWeight(.semibold)
                        .font(.system(size:25))
                        .foregroundColor(Color.white)
                        .tracking(1)
                    
                    
                    
                }
                
                Text("\(university.location)")
                    .font(.system(size:18))
                    .foregroundColor(Color.white)
                    .tracking(1)
                    .padding(.vertical, -20)
                    
                
                HStack{
                    Text("Acceptance Rate: \(university.rate)")
                        .font(.system(size:15))
                        .foregroundColor(rd)
                        .tracking(1)
                    Spacer()
                    Text("Endowment: \(university.endowment)")
                        .font(.system(size:15))
                        .foregroundColor(gr)
                        .tracking(1)
                }
                HStack{
                    Text("Average CAD: \(university.averageCost)")
                        .font(.system(size:15))
                        .foregroundColor(gr)
                        .tracking(1)
                    Spacer()
                   
                        Text("Closest date: \(university.availableDates.first ?? "Unknown")")
                            .font(.system(size:15))
                            .foregroundColor(gr)
                            .tracking(1)
                            .lineLimit(1)
                        
                    

                        
                    
                }
                Spacer()
            }
            .padding()
        }
        .frame(maxWidth: .infinity, minHeight: UIScreen.main.bounds.height / 7)
        .padding(.horizontal)
    }
    private func closestDateText() -> String {
        if university.availableDates.first == "" {
                return "None"
        } else if university.availableDates.first == "check" {
                return "No Data"
            } else {
                return university.availableDates.first ?? ""
            }
        }
    
}


