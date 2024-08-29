

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            
            VStack{
                if let user = viewModel.user {
                    Text("Welcome, ")
                    Text(user.fullname)
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
