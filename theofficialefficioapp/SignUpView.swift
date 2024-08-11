//
//  SignUpView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct SignUpView: View {
    @State private var fullname = ""
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
            VStack{
                Spacer()
                
                Text("Hello There!")
                    .font(.title)
                    .fontWeight(.bold)
                
                Image("columnslight")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 170, height: 170)
                    .padding()
                
                VStack{
                    TextField("Enter your full name", text: $fullname)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                    
                    TextField("Enter your username", text: $username)
                        .font(.subheadline)
                        .textInputAutocapitalization(.none)
                        .autocorrectionDisabled(true)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                    
                    TextField("Enter your email", text: $email)
                        .font(.subheadline)
                        .textInputAutocapitalization(.none)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                    
                    SecureField("Enter your password", text: $password)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                }
                
                Button {
                    dismiss()
                }label: {
                    Text("Sign Up")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 225, height: 44)
                        .background(.efficioblue)
                        .cornerRadius(15)
                }
                .padding(.vertical)
                
                Spacer()
                
                Divider()
                
                Button{
                    
                } label: {
                    HStack(spacing: 3) {
                        Text("Already have an account?")
                        
                        Text("Log In")
                            .fontWeight(.semibold)
                    }
                    .foregroundColor(.black)
                    .font(.footnote)
                }
                .padding(.vertical, 16)
                }
            }
        }
    
    
    #Preview {
        SignUpView()
    }

