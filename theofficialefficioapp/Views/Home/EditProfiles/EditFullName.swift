//
//  EditFullName.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 09/10/24.
//
import SwiftUI

struct EditFullName: View {
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
                .frame(height: 0.5)
            Text("Full Name")
                .font(.headline)
            TextField("Input your name...", text: $dataModel.fullname)
                .textFieldStyle(.roundedBorder)
        }.onAppear {
            viewModel.onUpdate = { isSuccess in
                router.navigateBack()
            }
        }
    }
}
