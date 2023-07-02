import SwiftUI

struct InfoView: View {
    var body: some View {
        
        ZStack{
            back.ignoresSafeArea()
            ScrollView{
                VStack {
                    Text("About Displayed Information")
                        .font(.system(size:30))
                        .bold()
                        .foregroundColor(Color.white)
                        .padding(.vertical, 30)
                        .padding(.horizontal, 20)
                        .lineLimit(1)
                    HStack{
                        Text("1. Acceptance Rates")
                            .font(.system(size:20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .lineLimit(1)
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                    
                    Text("The data is taken from 2027, 2026, and 2025 classes, primarily from universities' enrollment data. Also, take into account that the data is an average from all schools of the universities. When you are applying to university, you are actually applying to a certain school within this university. Therefore, the acceptance rate among different schools and majors of each university can vary drastically. For one, the average acceptance rate for Carnegie Mellon University is 13.5%, but for the School of Computer Science, it is around 5%. Additionally, when comparing acceptance rates, you should note that sets of students applying to different universities are different, meaning that if the acceptance rate for both universities is 10%, this does not necessarily mean that the complexity of getting into these universities is the same.")
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                    Spacer()
                    HStack{
                        Text("2. Average Cost After Aid(CAD)")
                            .font(.system(size:20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .lineLimit(1)
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                    Text("The average cost after aid is basically the average cost of tuition of students that received financial support. This is not the average cost of tuition and is not representative average cost of studying. When comparing CAD you should consider that students studying in different universities have different financial states and thus receive more or less financial aid. This does not mean that if CAD in the first university is higher than in the second, then on average students will pay higher in first university. For one, high CAD in Cornell University is derived from the fact that the university is located in Manhattan, and an average family is in sustainable financial state and do not need substantial financial aid and ,therefore, do not receive it.")
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                    
                    HStack{
                        Text("3. Rankings")
                            .font(.system(size:20))
                            .fontWeight(.semibold)
                            .foregroundColor(Color.white)
                            .lineLimit(1)
                            .padding(.horizontal, 10)
                        Spacer()
                    }
                    Text("Rankings are taken from internet resources and are inaccurate. First of all, ranking criteria among sources are different and for some students certain criterias could be more important that others. Secondly, the data's authenticity is not verified. Indeed, it is hard to calculate exact results for hundreads of universities. Still, if the university is in top-10, this clearly indicates that this is a very good university")
                        .fixedSize(horizontal: false, vertical: true)
                        .foregroundColor(Color.white)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 7)
                    
                }
                
            }
        }
        
    }
}

struct InfoView_Previews: PreviewProvider {
    static var previews: some View {
        InfoView()
    }
}
