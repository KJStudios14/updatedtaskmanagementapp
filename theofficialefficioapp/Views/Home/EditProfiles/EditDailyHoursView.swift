

import SwiftUI

struct EditDailyHoursView: View {
    @State private var selectedHour = 1
    @State private var selectedMinute = 0
    @StateObject var viewModel = ProfileEditModel()
    @State var dataModel:SignUpModel
    @EnvironmentObject var router: Router
    var body: some View {
            VStack{
                
                VStack(spacing: -100){
                    Spacer()
                    
                    Text("How many hours per day would you like to dedicate to studying?")
                        .mitrFont(.title2, weight: .medium)
                        .lineLimit(nil)
                        .multilineTextAlignment(.center)
                        .foregroundColor(Color(.efficioblue))
                        .padding(.horizontal, 5)
                        .padding(.bottom, -100)
                    
                    Spacer()
                    
                    HStack(spacing: 7) {
                        Picker(selection: $selectedHour, label: Text("")) {
                            ForEach(0..<6) { hour in
                                Text("\(hour)")
                                    .tag(hour)
                                    .mitrFont(.headline, weight: .regular)
                                    .foregroundColor(Color(.efficioblue))
                            }
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 50, height: 60)
                        .clipped()
                        
                        Text("hour(s)")
                            .mitrFont(.headline, weight: .regular)
                            .foregroundColor(Color(.efficioblue))
                        
                        
                        Picker(selection: $selectedMinute, label: Text("")) {
                            Text("0").tag(0)
                                .mitrFont(.headline, weight: .regular)
                                .foregroundColor(Color(.efficioblue))
                            Text("15").tag(15)
                                .mitrFont(.headline, weight: .regular)
                                .foregroundColor(Color(.efficioblue))
                            Text("30").tag(30)
                                .mitrFont(.headline, weight: .regular)
                                .foregroundColor(Color(.efficioblue))
                            Text("45").tag(45)
                                .mitrFont(.headline, weight: .regular)
                                .foregroundColor(Color(.efficioblue))
                        }
                        .pickerStyle(WheelPickerStyle())
                        .frame(width: 50, height: 60)
                        .clipped()
                        
                        Text("mins")
                            .mitrFont(.headline, weight: .regular)
                            .foregroundColor(Color(.efficioblue))
                        
                    }
                    .padding(.horizontal, 20)
                    .padding(.vertical, 5)
                    .background(Color(.white))
                    .cornerRadius(10)
                    
                    Spacer()
                }
                .padding(.bottom, 40)
                
                
                
                VStack {
                    Button {
                        dataModel.selectedHour = selectedHour
                        dataModel.selectedMinute = selectedMinute
                        viewModel.UpdateProfile()
                    } label: {
                        Text("Update")
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                    
                    Button {
                        router.navigateBack()
                    } label: {
                        Text("Back")
                            .foregroundColor(.efficioblue)
                            .frame(width: 225, height: 44)
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.efficioblue, lineWidth: 2)
                            )
                    }
                }
                .onAppear(perform: {
                    selectedHour = dataModel.selectedHour
                    selectedMinute = dataModel.selectedMinute
                    viewModel.onUpdate = { isSuccess in
                        if isSuccess {
                            router.navigateBack()
                        }
                    }
                })
                .mitrFont(.subheadline, weight: .regular)
                .padding(.vertical, 50)
            }.navigationBarBackButtonHidden()
    }
}
//
//#Preview {
//    DailyHoursView(viewModel: SignUpViewModel())
//}
