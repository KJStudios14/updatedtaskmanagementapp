

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @Binding var path: [String] 
    var body: some View {
        NavigationStack(path:$path){
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
                                    .padding(12)
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
                            viewModel.validate()
                        }label: {
                            Text("Next")
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
                        
                        Button {
                            path.removeLast()
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
                    }.navigationDestination(for: String.self) { value in
                        if value == "PreferedName" {
                            PreferredNameView(viewModel: viewModel, path: $path)
                        }
                    }
                }.navigationBarBackButtonHidden()
            .onAppear {
                viewModel.onValidated = { isSuccess in
                        path.append("PreferedName")
                }
            }
    }
}
    
//    
//    #Preview {
//        SignUpView()
//    }
