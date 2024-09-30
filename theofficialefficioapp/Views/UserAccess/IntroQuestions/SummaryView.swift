//
//  SummaryView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 28/08/2024.
//

import SwiftUI

struct SummaryView: View {
    @Binding var path: [String] 
    @StateObject public var viewModel:SignUpViewModel
    @State private var isSignedUp = false
    var body: some View {
        NavigationStack(path: $path) {
                VStack(alignment: .center, content: {
                    Spacer().frame(height: 32)
                    HStack{
                        Text("Preferd Name:")
                            .foregroundColor(.black)
                            .mitrFont(.title)
                        Text(viewModel.preferedName)
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                    HStack{
                        Text("Current Year Group:")
                            .foregroundColor(.black)
                            .mitrFont(.title)
                        Text(String(viewModel.selectedYear))
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                    HStack{
                        Text("Subjects:")
                            .foregroundColor(.black)
                            .mitrFont(.title)
                        Text(convertSetToString(viewModel.selectedSubjects))
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                    HStack{
                        Text("Goals:")
                            .foregroundColor(.black)
                            .mitrFont(.title)
                        Text(convertArrayToString(viewModel.selectedGoals))
                            .foregroundColor(.black)
                            .lineLimit(0)
                            .mitrFont(.title2)
                    }
                    HStack{
                        Text("Daily Hours:")
                            .foregroundColor(.black)
                            .mitrFont(.title)
                        Text("\(viewModel.selectedHour)Hrs \(viewModel.selectedMinute)Mins")
                            .foregroundColor(.black)
                            .mitrFont(.title2)
                    }
                })
                
                
                VStack {
                    Button {
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
                        path.removeLast()
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
            }.navigationDestination(isPresented: $isSignedUp) {
                BottomNavBarView()
            }.onAppear {
                viewModel.onRegister = { isSuccessfull in
                        isSignedUp = isSuccessfull
                }
            }

    }
    
   
}
//
//#Preview {
//    SummaryView(viewModel: SignUpViewModel())
//}
