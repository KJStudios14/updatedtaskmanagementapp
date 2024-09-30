

import SwiftUI

struct SignUpView: View {
    @StateObject var viewModel = SignUpViewModel()
    @State var dataModel = SignUpModel()
    @EnvironmentObject var router: Router
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
                                .padding(12)
                        }
                        TextField("Enter your full name", text: $dataModel.fullname)
                            .font(.subheadline)
                            .padding(12)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                        
                        TextField("Enter your username", text: $dataModel.username)
                            .font(.subheadline)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .autocorrectionDisabled(true)
                            .padding(12)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                        
                        TextField("Enter your email", text: $dataModel.email)
                            .font(.subheadline)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .padding(12)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                        
                        SecureField("Enter your password", text: $dataModel.password)
                            .font(.subheadline)
                            .padding(12)
                            .background(Color(.systemGray6))
                            .cornerRadius(10)
                            .padding(.horizontal, 30)
                    }
                    
                    Button {
                        viewModel.dataModel = dataModel
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
                        router.navigateBack()
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
                }.navigationBarBackButtonHidden()
            .onAppear {
                viewModel.onValidated = { isSuccess in
                    router.navigate(to: .PreferedName(dataModel: dataModel))
                }
            }
    }
}
    
//    
//    #Preview {
//        SignUpView()
//    }
