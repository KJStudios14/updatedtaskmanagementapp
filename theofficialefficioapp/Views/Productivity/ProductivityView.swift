
import SwiftUI

struct ProductivityView: View {
    @State private var showSheet = false
    @State private var selectedView: String? = nil
    @StateObject var viewModel:ProductivityViewModel = ProductivityViewModel()
    @EnvironmentObject var router: Router
    @State var dataModel: ProductivityModel  = ProductivityModel()
    var body: some View {
        NavigationView {
            VStack {
                HStack {
                    Text("My Productivity")
                        .mitrFont(.title, weight: .semibold)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Menu {
                        Button(action: {
                            selectedView = "StopWatch"
                            router.navigate(to: .StopWatch)
                        }) {
                            Text("Stopwatch")
                        }
                        Button(action: {
                            selectedView = "ChooseTimer"
                            router.navigate(to: .ChooseTimer)
                        }) {
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
                
                VStack(spacing: 5) {
                    Text("Daily Overview")
                        .mitrFont(.title2, weight: .regular)
                        .padding(.top, 10)
                    
                    VStack {
                        // Focus time
                        VStack {
                            Text("Focus")
                                .mitrFont(.headline, weight: .medium)
                            Text("\((viewModel.getTodayModel()?.focusTime ?? 0).hoursAndMinutes)")
                                .mitrFont(.title, weight: .regular)
                        }
                        .padding(.top, 30)
                        .padding(.bottom, 5)
                        Spacer()
                        
                        // Other stats
                        HStack {
                            Spacer()
                            VStack {
                                Text("\(viewModel.getTodayModel()?.sessionCount ?? 0)")
                                    .mitrFont(.title2, weight: .regular)
                                Text("Sessions")
                                    .mitrFont(.footnote, weight: .medium)
                            }
                            .padding(.horizontal, 5)
                            
                            Spacer()
                            
                            VStack {
                                Text("\(viewModel.getTodayModel()?.completedTasks ?? 0)")
                                    .mitrFont(.title2, weight: .regular)
                                Text("Completed")
                                    .mitrFont(.footnote, weight: .medium)
                            }
                            .padding(.horizontal, 5)
                            
                            Spacer()
                            
                            VStack {
                                Text("\(viewModel.getTodayModel()?.remaingTasks ?? 0)")
                                    .mitrFont(.title2, weight: .regular)
                                Text("Remaining")
                                    .mitrFont(.footnote, weight: .medium)
                            }
                            .padding(.horizontal, 5)
                            Spacer()
                        }
                        .padding(.bottom, 30)
                    }
                    .frame(width: 350, height: 160)
                    .background(Color(.blue3))
                    .cornerRadius(15)
                    .padding(.bottom, 20)
                    
                    
                    
                    WeeklyTaskChartView()
                    .frame(width: 350, height: 300)
                    .background(Color(.blue3))
                    .cornerRadius(15)
                    
                    Spacer()
                }
            }.onAppear {
                self.dataModel = viewModel.getTodayModel() ?? ProductivityModel()
            }
            
        }
    }
}

struct ProductivityView_Previews: PreviewProvider {
    static var previews: some View {
        ProductivityView()
    }
}
