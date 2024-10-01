

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = UserViewModel()
    @EnvironmentObject var router: Router
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
                    Text("Welcome \(user.preferedname)")
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
                                    Text("\(user.preferedname)")
                                        .mitrFont(.footnote, weight: .light)
                                    Text(user.username)
                                        .mitrFont(.footnote, weight: .light)
                                    Text("\(user.selectedyear)")
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
