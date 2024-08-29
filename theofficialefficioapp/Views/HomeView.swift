

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
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
                            Text(user.fullname)
                        }
                        
                        HStack {
                            Text("Username: ")
                            Text(user.username)
                        }
                        
                        HStack {
                            Text("Email: ")
                            Text(user.email)
                        }
                        
                        HStack {
                            Text("Member Since: ")
                            
                            Text(Date(timeIntervalSince1970: user.joined)
                                    .formatted(date: .abbreviated, time: .shortened))
                        }
                    }
                    
                    //Sign out
                    Button {
                        viewModel.logOut()
                    } label: {
                        Text("Log Out")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                } else {
                    Text("Loading Profile...")
                }
                
            }
            .navigationTitle("Home")
        }
        .onAppear{
            viewModel.fetchUser()
        }
    }
}


#Preview {
    HomeView()
}
