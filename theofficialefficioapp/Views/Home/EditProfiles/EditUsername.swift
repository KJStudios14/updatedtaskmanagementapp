

//
//  EditFullName.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 09/10/24.
//
import SwiftUI

struct EditUsername: View {
    @StateObject var viewModel = ProfileEditModel()
    
    @State var dataModel:SignUpModel
    
    @EnvironmentObject var router: Router

    var body: some View {
        
        VStack {
            HStack {
                
                Button("Cancel") {
                    router.navigateBack()
                }
                Spacer()
                
                Button("Update") {
                    viewModel.UpdateProfile()
                }
            }.background(.white)
            Spacer()
                .background(Color.black)
                .frame(height: 16)
            Text("Username")
                .font(.headline)
            TextField("Input your name...", text: $dataModel.username)
                .textFieldStyle(.roundedBorder)
            Spacer()
        }.onAppear {
            viewModel.onUpdate = { isSuccess in
                router.navigateBack()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}
