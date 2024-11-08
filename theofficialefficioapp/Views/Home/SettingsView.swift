
import SwiftUI

struct SettingsView: View {
    @State private var showAlert = false
    @State private var isLogout = false
    @StateObject var viewModel = UserViewModel()
    @EnvironmentObject var router: Router
    var appVersion: String {
            // Fetch the app version from the Info.plist
            if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
               let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
                return "Version \(version) (\(build))"
            }
            return "Version not available"
        }
    
    var body: some View {
//        NavigationView {
            VStack{
                HStack(alignment: .center, content: {
                    Spacer().frame(width: 16)
                    
                    Button {
                        router.navigateBack()
                    }label: {
                        Image("back_button")
                            .frame(width: 16, height: 16)
                    }
                    
                    
                    Spacer().frame(width: 16)
                    
                    Text("Settings")
                        .mitrFont(.title, weight: .regular)
                        .padding(.bottom, -5)
                    Spacer()
                    
                })
               
                
                Form {
                    
                    Section(header: Text("Support")) {
                        Button {
                            router.navigate(to: .contactUs)
                        } label: {
                            Text("Contact us")
                                .mitrFont(.subheadline, weight: .medium)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 34)
                                .background(Color.efficioblue)
                                .cornerRadius(15)
                            
                        }
                        .frame(width: 200, height: 44)
                        Button {
                            router.navigate(to: .suggestion)
                        } label: {
                            Text("Send Suggestion")
                                .mitrFont(.subheadline, weight: .medium)
                                .foregroundColor(.white)
                                .frame(width: 200, height: 34)
                                .background(Color.efficioblue)
                                .cornerRadius(15)
                            
                        }
                            .frame(width: 200, height: 44)
                    }
                    .mitrFont(.headline, weight: .regular)
                    
                    Section(header: Text("About")) {
                        HStack {
                            Text("App Version")
                            Spacer()
                            Text(appVersion)
                                .foregroundColor(.gray)
                        }
                        Button {
                            router.navigate(to: .licenseAndLegalView)
                        } label: {
                            Text("License and Legal")
                                .foregroundColor(.gray)
                        }
                    }
                    .mitrFont(.headline, weight: .regular)
                }
                .scrollContentBackground(.hidden)
                
                Spacer()
                               
               Button {
                   isLogout.toggle()
               } label: {
                   Text("Log Out")
                       .mitrFont(.subheadline, weight: .medium)
                       .foregroundColor(.white)
                       .frame(width: 200, height: 44)
                       .background(Color.efficioblue)
                       .cornerRadius(15)
               }
               .padding(.bottom, 3)
               .frame(width: 200, height: 44)
                
                Button {
                    showAlert.toggle()
                } label: {
                    Text("Delete Account")
                        .mitrFont(.subheadline, weight: .medium)
                        .foregroundColor(.black)
                        .frame(width: 200, height: 44)
                        .cornerRadius(15)
                }.padding(.bottom, 3)
                    .frame(width: 200, height: 44)
            }.alert(isPresented: $showAlert) {
                Alert(
                    title: Text("Are you sure you want to delete your account?"),
                    primaryButton: .destructive(Text("Delete")) {
                        viewModel.deleteAccount()
                    },
                    secondaryButton: .cancel()
                )
            }
            .alert(isPresented: $isLogout) {
                Alert(
                    title: Text("Are you sure you want to logout your account?"),
                    primaryButton: .destructive(Text("Logout")) {
                        viewModel.logOut()
                        router.navigateToRoot()
                    },
                    secondaryButton: .cancel()
                )
            }
            .onAppear {
                viewModel.onDeleted = { isSuccess in
                    if isSuccess{
                        router.navigateToRoot()
                    }
                }
            }
            .navigationBarBackButtonHidden(true)

//        }
    }
}

struct ContactUsView: View {
    
    @EnvironmentObject var router: Router
    var body: some View {
        VStack {
            HStack {
                Spacer().frame(width: 16)
                
                Button {
                    router.navigateBack()
                }label: {
                    Image("back_button")
                        .font(.title)
                }
                .frame(width: 16, height: 16)
                
                Spacer()
            }
            
            
            Text("We're Here to Help")
                .mitrFont(.title2, weight: .medium)
            
            Text("If you have any questions, concerns, or have faced any issues with the app, please don't hesitate to reach out to us. Your feedback is invaluable, and we are committed to providing you with the best possible experience. You can contact us directly at:")
                .mitrFont(.subheadline, weight: .regular)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
                .padding(.top, 3)
            
            Text("efficioapp@gmail.com")
                .mitrFont(.headline, weight: .regular)
                .foregroundColor(.blue)
                .padding(.top, 10)
            
            Spacer()
        }
        .navigationBarBackButtonHidden(true)
        .padding()

    }
}


struct FeedbackFormView: View {
    @EnvironmentObject var router: Router
    @State private var feedback: String = ""

    var body: some View {
        VStack {
            // Message Text
            HStack {
                Spacer().frame(width: 16)
                
                Button {
                    router.navigateBack()
                }label: {
                    Image("back_button")
                        .font(.title)
                }
                .frame(width: 16, height: 16)
                
                Spacer()
            }
            Text("We Value Your Suggestions")
                .mitrFont(.title2, weight: .medium)
                .padding(.top, 4)
                .padding(.bottom, 3)
            
            Text("Please let us know if there’s anything we can improve about the app. Your suggestions are important to us and will help us make the app better for everyone.")
                .mitrFont(.subheadline, weight: .regular)
                .padding(.horizontal)
                .padding(.bottom, -15)
            
            Form {
                Section {
                    TextEditor(text: $feedback)
                        .mitrFont(.subheadline, weight: .regular)
                        .frame(minHeight: 200)
                        .cornerRadius(8)
                        .padding(4)
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                }
            }
            .scrollContentBackground(.hidden)
            .padding(.horizontal)
            
            Button(action: {
                sendFeedback()
            }) {
                Text("Submit")
                    .foregroundColor(.white)
                    .mitrFont(.headline, weight: .regular)
                    .frame(width: 150, height: 20)
                    .padding()
                    .background(Color.efficioblue)
                    .cornerRadius(12)
                    .padding(.horizontal)
                    .padding(.bottom, 200)
            }
            Spacer()
        }.navigationBarBackButtonHidden(true)
    }
    
    func sendFeedback() {
        // Handle the feedback submission, e.g., by sending an email or posting to a server
        print("Feedback submitted: \(feedback)")
        // Reset feedback input
        feedback = ""
        router.navigateBack()
    }
}


//
//#Preview {
//    SettingsView()
//}
