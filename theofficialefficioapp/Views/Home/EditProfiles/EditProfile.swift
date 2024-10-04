//
//  EditProfile.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 03/10/24.
//
import SwiftUI

struct EditProfile: View {
    @StateObject var viewModel = ProfileEditModel()
    
    @State var dataModel:SignUpModel
    
    @EnvironmentObject var router: Router
    var body: some View {
        
                VStack{
                    
                    
                    Text("Edit Profile!")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    
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
                        
                        TextField("Enter your prefredname", text: $dataModel.preferedName)
                            .font(.subheadline)
                            .autocapitalization(/*@START_MENU_TOKEN@*/.none/*@END_MENU_TOKEN@*/)
                            .autocorrectionDisabled(true)
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
                    }
                    
                    Button {
                        viewModel.dataModel = dataModel
                        viewModel.UpdateProfile()
                    }label: {
                        Text("Update Profile")
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
                    
                }
            .onAppear {
                viewModel.onUpdate = { isSuccess in
                    router.navigateBack()
                }
            }
    }
}
