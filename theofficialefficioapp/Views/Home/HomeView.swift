

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()

    var currentDateString: String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE d'\(daySuffix(from: Date()))' MMMM"
        return formatter.string(from: Date())
    }
    var body: some View {
        NavigationView {
        VStack {
            TopNavigationBarView()
            
            Spacer()

            if let user = viewModel.user {
                VStack(alignment: .leading){
                    Text("Welcome [preferredName]")
                        .mitrFont(.title2, weight: .regular)
                        .padding(.bottom, -2)
                    
                    VStack{
                        HStack{
                            VStack{
                                Image(systemName: "person.circle")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 90, height: 90)
                                Text(Date(timeIntervalSince1970: user.joined)
                                    .formatted(.dateTime.year().month()))
                                .mitrFont(.caption, weight: .light)
                            }
                            Spacer()
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
                                            .frame(width: 90, height: 20)
                                            .foregroundColor(.white)
                                            .background(Color.efficioblue)
                                            .mitrFont(.caption, weight: .regular)
                                            .cornerRadius(5)
                                    }
                                }
                            }
                            .frame(width: 200, height: 150)
                        }
                        .padding(.horizontal, 15)
                    }
                    .frame(width: 350, height: 150)
                    .cornerRadius(15)
                    .background(Color(.blue3))
                    
                    VStack{
                        Text(currentDateString)
                            .padding(.bottom, -1)
                            .mitrFont(.headline, weight: .regular)
                    }
                    .padding(.top, 2)
                    .padding(.bottom, 7)
                    
                    VStack{
                        Text("Tasks for Today")
                            .mitrFont(.title2, weight: .regular)
                    }
                    
                    Spacer()
                    
                    
                }
                Spacer()
             }
            else {
                Text("Loading Profile...")
             }
             
        }
        .onAppear{
            viewModel.fetchUser()
            }
        }
    }
    
    func daySuffix(from date: Date) -> String {
            let calendar = Calendar.current
            let day = calendar.component(.day, from: date)

            switch day {
            case 1, 21, 31: return "st"
            case 2, 22: return "nd"
            case 3, 23: return "rd"
            default: return "th"
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
 
 
 VStack(alignment: .leading){
     Text("Welcome, [preferredName]")
         .mitrFont(.title2, weight: .regular)
         .padding(.top, 5)
     
     HStack(spacing: 30){
         VStack{
             Image(systemName: "person.circle")
                 .resizable()
                 .aspectRatio(contentMode: .fit)
                 .frame(width: 90, height: 90)
             Text(Date(timeIntervalSince1970: user.joined)
                 .formatted(.dateTime.year().month()))
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
                     .mitrFont(.caption, weight: .regular)
                     .frame(width: 140, height: 20)
                     .cornerRadius(10)
             }
         }
     }
 }
 .frame(width: 300, height: 150)
 .cornerRadius(10)
 .background(Color(.blue3))
     
    
 VStack(alignment: .leading) {
     Text(currentDateString)
         .mitrFont(.headline, weight: .regular)
     Text("Today's Tasks")
             .mitrFont(.title2, weight: .regular)
             .padding(.top, 15)
 }
 .padding(.top, 10)
     
 Spacer()
 }
 

 
Spacer()

 */


/*
 struct HomeView: View {
     @StateObject var viewModel = HomeViewModel()

     var currentDateString: String {
         let formatter = DateFormatter()
         formatter.dateFormat = "EEEE d'\(daySuffix(from: Date()))' MMMM"
         return formatter.string(from: Date())
     }
     var body: some View {
         NavigationView {
         VStack {
             TopNavigationBarView()
             
             Spacer()

             if let user = viewModel.user {
                 
                 
              }
             else {
                 Text("Loading Profile...")
              }
              
         }
         .onAppear{
             viewModel.fetchUser()
             }
         }
     }
     
     func daySuffix(from date: Date) -> String {
             let calendar = Calendar.current
             let day = calendar.component(.day, from: date)

             switch day {
             case 1, 21, 31: return "st"
             case 2, 22: return "nd"
             case 3, 23: return "rd"
             default: return "th"
             }
         }
     }

     struct HomeView_Previews: PreviewProvider {
         static var previews: some View {
             HomeView()
         }
     }
 */
