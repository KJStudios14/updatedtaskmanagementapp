

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
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
                    if !viewModel.errorMessage.isEmpty{
                        Text(viewModel.errorMessage)
                            .foregroundColor(Color.red)
                    }
                    TextField("Enter your full name", text: $viewModel.fullname)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                    
                    TextField("Enter your username", text: $viewModel.username)
                        .font(.subheadline)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                        .autocorrectionDisabled(true)
                        .padding(12)
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal, 30)
                    
                    TextField("Enter your email", text: $viewModel.email)
                        .font(.subheadline)
                        .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
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
                
                Button {
                    viewModel.register()
                    // Optional delay before dismiss to ensure data is saved
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                dismiss()
                            }
                }label: {
                    Text("Create Account")
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
                
                NavigationLink {
                    LogInView()
                        .navigationBarBackButtonHidden(true)
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
