//
//  SummaryView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 28/08/2024.
//

import SwiftUI

struct SummaryView: View {
     
    @StateObject public var viewModel:RegisterViewModel = RegisterViewModel()
    @State public var dataModel:SignUpModel
    @EnvironmentObject var router: Router
    
    
    var body: some View {
        VStack(alignment: .leading, content: {
                    Spacer().frame(height: 32)
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                            .padding(12)
                    }
                    HStack{
                        Text("Preferd Name:")
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                        Text(dataModel.preferedName)
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                    HStack{
                        Text("Current Year Group:")
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                        Text(String(dataModel.selectedYear))
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                    HStack{
                        Text("Subjects:")
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                        Text(convertSetToString(dataModel.selectedSubjects))
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                    HStack{
                        Text("Goals:")
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                        Text(convertArrayToString(dataModel.selectedGoals))
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                    HStack{
                        Text("Daily Hours:")
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                        Text("\(dataModel.selectedHour)Hrs \(dataModel.selectedMinute)Mins")
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                })
                
                
                VStack {
                    Button {
                        viewModel.dataModel = dataModel
                        viewModel.register()
                    }label: {
                        Text("Create Account")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(.efficioblue)
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
                    
                }.mitrFont(.subheadline, weight: .regular)
                        .padding(.vertical, 50)
                        .onAppear {
                            viewModel.onRegister = { isSuccessfull in
                                if isSuccessfull {
                                    router.navigate(to: .MainView)
                                }else{
                                    
                                }
                            }
            }
            .navigationBarBackButtonHidden()
    }
    
   
}

