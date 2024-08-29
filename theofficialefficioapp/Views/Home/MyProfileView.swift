//
//  MyProfileView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 29/08/2024.
//

import SwiftUI

struct MyProfileView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {

        ZStack {
            Color.efficioblue
                .ignoresSafeArea()
            VStack {
                if let user = viewModel.user {
                    //Avatar
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(Color.blue)
                        .frame(width: 125, height: 125)
                    
                    
                    //Info: Name, Email, Member Since
                    VStack(alignment: .leading){
                        HStack {
                            Text("Full Name: ")
                                .mitrFont(.headline, weight: .semibold)
                            Spacer()
                            Text(user.fullname)
                                .mitrFont(.headline, weight: .light)
                        }
                        
                        HStack {
                            Text("Username: ")
                                .mitrFont(.headline, weight: .semibold)
                            Spacer()
                            Text(user.username)
                                .mitrFont(.headline, weight: .light)
                        }
                        
                        HStack {
                            Text("Email: ")
                                .mitrFont(.headline, weight: .semibold)
                            Spacer()
                            Text(user.email)
                                .mitrFont(.headline, weight: .light)
                        }
                        
                        HStack {
                            Text("Member Since: ")
                                .mitrFont(.headline, weight: .semibold)
                            Spacer()
                            Text(Date(timeIntervalSince1970: user.joined)
                                .formatted(.dateTime.year().month().day()))
                                .mitrFont(.headline, weight: .light)
                            
                        }
                    }
                    
                    //Sign out
                    Button {
                        viewModel.logOut()
                    } label: {
                        Text("Log Out")
                            .mitrFont(.subheadline, weight: .semibold)
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                } else {
                    Text("Loading Profile...")
                }
                
            }
        }
        
}
}



#Preview {
    MyProfileView()
}

