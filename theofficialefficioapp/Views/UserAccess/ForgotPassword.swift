//
//  SignInView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 10/08/2024.
//

import SwiftUI

struct ForgotPasswordView: View {
    @EnvironmentObject var router: Router

    @StateObject var viewModel = LogInViewModel()
    
    var body: some View {
//        NavigationStack {
            VStack{
                Spacer()
                Text("Forgot Password")
                    .font(.title)
                    .fontWeight(.bold)
                
                Image("columnslight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 170)
                    .padding()
                
                VStack{
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Enter your email", text: $viewModel.email)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                
                
                Button {
                    viewModel.forgotPassword()
                } label: {
                    Text("Submit")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 225, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(15)
                }
                
                Spacer()
                
                Divider()
                
                Button {
                    router.navigateBack()
                } label: {
                    HStack() {
                        Text("Login")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
                
            }.navigationBarBackButtonHidden()
        
            .onAppear {
                viewModel.onValidated = { isSuccess in
                    if isSuccess{
                        router.navigateBack()
                    }
                }
            }
        }
    }


//struct LogInView_Previews: PreviewProvider {
//    static var previews: some View {
//        LogInView()
//    }
//}

