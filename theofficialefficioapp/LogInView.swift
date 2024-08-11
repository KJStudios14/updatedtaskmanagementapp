//
//  SignInView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 10/08/2024.
//

import SwiftUI

struct LogInView: View {
    @StateObject var viewModel = LogInViewModel()
    
    var body: some View {
        NavigationStack {
            VStack{
                Spacer()
                Text("Welcome Back!")
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
                    
                    SecureField("Enter your password", text: $viewModel.password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                
                NavigationLink {
                    Text("Forgot password")
                } label: {
                    Text("Forgot password?")
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .padding(.vertical)
                        .padding(.trailing, 20)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .trailing)
                }
                
                
                Button {
                    viewModel.login()  
                } label: {
                    Text("Log In")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 225, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(15)
                }
                
                Spacer()
                
                Divider()
                
                NavigationLink {
                    SignUpView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 3) {
                        Text("Don't have a account?")
                        
                        Text("Sign Up")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
                
                }
            }
        }
    }


struct LogInView_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

