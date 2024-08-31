
import SwiftUI

struct ProductivityView: View {
    var body: some View {
        NavigationView{
            VStack{
                
                HStack {
                    Text("My Productivity")
                        .mitrFont(.title, weight: .semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Menu {
                        NavigationLink(destination: StopWatchView()) {
                            Text("Stopwatch")
                        }
                        NavigationLink(destination: ChooseTimerView()) {
                            Text("Choose Timer")
                        }
                    } label: {
                        Image(systemName: "timer")
                            .resizable()
                            .frame(width: 30, height: 30)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.efficioblue)
                
                VStack(spacing: 5){
                    Text("Daily Overview")
                        .mitrFont(.title2, weight: .regular)
                        .padding(.top, 10)
                    
                    VStack{
                        VStack{
                            //focus time
                            VStack{
                                Text("Focus")
                                    .mitrFont(.headline, weight: .medium)
                                Text("3hr 5m")
                                    .mitrFont(.title, weight: .regular)
                            }
                            .padding(.top, 30)
                            .padding(.bottom, 5)
                            Spacer()
                            //other stats
                            VStack{
                                HStack{
                                    Spacer()
                                    VStack{
                                        Text("10")
                                            .mitrFont(.title2, weight: .regular)
                                        Text("Sessions")
                                            .mitrFont(.footnote, weight: .medium)
                                    }
                                    .padding(.horizontal, 5)
                                    
                                    
                                    Spacer()
                                    VStack{
                                        Text("4")
                                            .mitrFont(.title2, weight: .regular)
                                        Text("Completed")
                                            .mitrFont(.footnote, weight: .medium)
                                    }
                                    .padding(.horizontal, 5)
                                    
                                    
                                    Spacer()
                                    VStack{
                                        Text("4")
                                            .mitrFont(.title2, weight: .regular)
                                        Text("Remaining")
                                            .mitrFont(.footnote, weight: .medium)
                                    }
                                    .padding(.horizontal, 5)
                                    Spacer()
                                }
                                .padding(.bottom, 30)
                            }
                        }
                    }
                    .frame(width: 350, height: 160)
                    .background(Color(.blue3))
                    .cornerRadius(15)
                    .padding(.bottom, 20)
                    
                    
                    VStack(spacing: 5){
                        
                        }
                        .frame(width: 350, height: 300)
                        .background(Color(.blue3))
                        .cornerRadius(15)
                    }
                    
                    Spacer()
                    
                    
                    
                    
                }
            }
        }
    }
    
    
    struct ProductivityView_Previews: PreviewProvider {
        static var previews: some View {
            ProductivityView()
        }
    }



/*VStack{
 Image(systemName: "clock")
     .resizable()
     .frame(width: 50, height: 50)
     .foregroundColor(.efficioblue)
     .padding(.vertical, 20)
    
 HStack{
     
     NavigationLink {
         ChooseTimerView()
             .navigationBarBackButtonHidden(true)
     } label: {
         Text("Timer")
     }
     NavigationLink {
         StopWatchView()
             .navigationBarBackButtonHidden(true)
     } label: {
         Text("Stopwatch")
     }
 }
 .padding(.top, 10)
}
.frame(width: 350, height: 200)
.background(Color(.blue3))
.cornerRadius(10)
.padding(.bottom, 20)*/
