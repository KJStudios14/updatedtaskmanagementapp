
import SwiftUI

struct ProductivityView: View {
    var body: some View {
        NavigationView{
            
            HStack{
                NavigationLink {
                    ChooseTimerView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Timer")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(width: 150, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(15)
                }
                NavigationLink {
                    StopWatchView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Stopwatch")
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                        .frame(width: 150, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(15)
                }
            }
            
            
            }
            .navigationTitle("My Productivity")
        }
    }


#Preview {
    ProductivityView()
}
