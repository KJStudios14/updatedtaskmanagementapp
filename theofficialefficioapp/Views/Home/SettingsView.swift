
import SwiftUI

struct SettingsView: View {
    @StateObject var viewModel = HomeViewModel()
    
    var appVersion: String {
            // Fetch the app version from the Info.plist
            if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
               let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
                return "Version \(version) (\(build))"
            }
            return "Version not available"
        }
    
    var body: some View {
        NavigationView {
            VStack{
                Text("Settings")
                    .mitrFont(.title, weight: .regular)
                    .padding(.bottom, -5)
                
                Form {
                    
                    Section(header: Text("Support")) {
                        NavigationLink(destination: ContactUsView() .navigationBarBackButtonHidden(true)) {
                            Text("Contact Us")
                        }
                        
                        NavigationLink(destination: FeedbackFormView() .navigationBarBackButtonHidden(true)) {
                            Text("Send Suggestion")
                        }
                    }
                    .mitrFont(.headline, weight: .regular)
                    .padding(.bottom, -20)
                    
                    Section(header: Text("About")) {
                        HStack {
                            Text("App Version")
                            Spacer()
                            Text(appVersion)
                                .foregroundColor(.gray)
                        }
                        NavigationLink(destination: LicenseAndLegalView() .navigationBarBackButtonHidden(true)) {
                            Text("License and Legal")
                        }
                    }
                    .mitrFont(.headline, weight: .regular)
                }
                .scrollContentBackground(.hidden)
                
                Spacer()
                               
               Button {
                   viewModel.logOut()
               } label: {
                   Text("Log Out")
                       .mitrFont(.subheadline, weight: .medium)
                       .foregroundColor(.white)
                       .frame(width: 200, height: 44)
                       .background(Color.efficioblue)
                       .cornerRadius(15)
               }
               .padding(.bottom, 3)
                
                Text("Delete Account")
                    .mitrFont(.subheadline, weight: .medium)
                    .foregroundColor(.red)
                    .padding(.bottom, 8)
            }

        }
    }
}

struct ContactUsView: View {
    var body: some View {
        VStack {
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
        .padding()

    }
}


struct FeedbackFormView: View {
    @State private var feedback: String = ""

    var body: some View {
        VStack {
            // Message Text
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
        }
    }
    
    func sendFeedback() {
        // Handle the feedback submission, e.g., by sending an email or posting to a server
        print("Feedback submitted: \(feedback)")
        // Reset feedback input
        feedback = ""
    }
}



#Preview {
    SettingsView()
}
