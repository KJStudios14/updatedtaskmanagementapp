

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                    Image(systemName: "person.circle")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.efficioblue)
                        .frame(width: 125, height: 125)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        HStack {
                            Text("Name: ")
                                .bold()
                            Text(user.fullname)
                        }
                        .padding(3)
                        HStack {
                            Text("Username: ")
                                .bold()
                            Text(user.username)
                        }
                        .padding(3)
                        HStack {
                            Text("Email: ")
                                .bold()
                            Text(user.email)
                        }
                        .padding(3)
                        HStack {
                            Text("Member Since: ")
                                .bold()
                            Text(Date(timeIntervalSince1970: user.joined)
                                .formatted(date: .abbreviated, time: .shortened)
                            )
                        }
                        .padding(3)
                    }
                    .padding()
                    
                    Button {
                        viewModel.logOut()
                    } label: {
                        Text("Log Out")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 150, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                    Spacer()
                
                } else {
                    Text("Loading Home Page...")
                }
            }
            .navigationTitle("Home")
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    HomeView()
}
