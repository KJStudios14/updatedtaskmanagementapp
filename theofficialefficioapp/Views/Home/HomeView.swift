

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            
        VStack {
            if let user = viewModel.user {
                VStack(alignment: .trailing){
                    HStack(spacing: 30){
                        VStack{
                            Image(systemName: "person.circle")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 60, height: 60)
                            Text(Date(timeIntervalSince1970: user.joined)
                            .formatted(.dateTime.year().month().day()))
                            .mitrFont(.caption, weight: .light)
                        }
                        
                        VStack{
                            VStack(alignment: .leading){
                                Text("[preferredname]")
                                    .mitrFont(.footnote, weight: .light)
                                Text(user.username)
                                    .mitrFont(.footnote, weight: .light)
                                Text("[yeargroup]")
                                    .mitrFont(.footnote, weight: .light)
                            }
                            
                            VStack(alignment: .trailing){
                                NavigationLink{
                                    MyProfileView()
                                } label: {
                                    Text("Edit Profile")
                                        .foregroundColor(.white)
                                        .background(Color.efficioblue)
                                        .mitrFont(.caption, weight: .light)
                                        .frame(width: 140, height: 20)
                                        .cornerRadius(5)
                                }
                            }
                        }
                    }
                    .padding(.horizontal, 10)
                   
                }
             Spacer()
             
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
             
            .onAppear{
                viewModel.fetchUser()
            }
        }
    }
    
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
        }
    }
    
    
    /*
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
     Text(user.fullname)
     .mitrFont(.headline, weight: .light)
     }
     
     HStack {
     Text("Username: ")
     .mitrFont(.headline, weight: .semibold)
     Text(user.username)
     .mitrFont(.headline, weight: .light)
     }
     
     HStack {
     Text("Email: ")
     .mitrFont(.headline, weight: .semibold)
     Text(user.email)
     .mitrFont(.headline, weight: .light)
     }
     
     HStack {
     Text("Member Since: ")
     .mitrFont(.headline, weight: .semibold)
     
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
     */
}

/*
VStack{
    TopNavigationBarView()
    
    Spacer()
    
    HStack{
        Text("Welcome")
        Text(user.fullname)
    }
    .padding(.bottom, 10)
    
    VStack{
        HStack{
            VStack{
                Image(systemName: "person.circle")
                    .frame(width: 30, height: 30)
                Text(Date(timeIntervalSince1970: user.joined)
                .formatted(.dateTime.year().month().day()))
                .mitrFont(.caption, weight: .light)
            }
            
            VStack{
                VStack(alignment: .leading){
                    Text("[preferredname]")
                        .mitrFont(.footnote, weight: .light)
                    Text(user.username)
                        .mitrFont(.footnote, weight: .light)
                    Text("[yeargroup]")
                        .mitrFont(.footnote, weight: .light)
                }
                
                VStack(alignment: .trailing){
                    NavigationLink{
                        MyProfileView()
                    } label: {
                        Text("Edit Profile")
                            .foregroundColor(.white)
                            .background(Color.efficioblue)
                            .mitrFont(.caption, weight: .light)
                            .frame(width: 30, height: 4)
                    }
                }
            }
        }
    }
    .background(Color(.purple))
    
    Spacer()
}
*/
