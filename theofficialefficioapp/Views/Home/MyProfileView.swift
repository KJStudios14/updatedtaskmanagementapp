

import SwiftUI
import UIKit

struct MyProfileView: View {
    @State private var showingImagePicker = false
    @State private var profileImage: UIImage? = nil
    
    @StateObject var userModel:UserViewModel = UserViewModel()
    
    @EnvironmentObject var router: Router
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color(.efficioblue)
                    .frame(height: 150)
                
                VStack {
                    ZStack {
                        if let image = profileImage {
                            Image(uiImage: image)
                                .resizable()
                                .clipShape(Circle())
                                .frame(width: 100, height: 100)
                        } else {
                            Circle()
                                .fill(Color.white)
                                .frame(width: 100, height: 100)
                            
                            Image(systemName: "person.circle.fill")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .foregroundColor(.gray)
                        }
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .padding(4)
                            .background(Color.black.opacity(0.4))
                            .clipShape(Circle())
                            .offset(x: 35, y: 35)
                            .onTapGesture {
                                showingImagePicker = true
                            }
                    }
                    .offset(y: 70)
                }
            }
            .frame(height: 100)
            .zIndex(1)

            VStack(alignment: .leading, spacing: 20) {
                ProfileRow(title: "Full name", value:userModel.user?.fullname ?? "")
                    .onTapGesture {
                    var userProfile:SignUpModel = SignUpModel()
                    userProfile.fullname = userModel.user?.fullname ?? ""
                    userProfile.preferedName = userModel.user?.preferedname ?? ""
                    userProfile.username = userModel.user?.username ?? ""
                    userProfile.email = userModel.user?.email ?? ""
                    userProfile.selectedSubjects = Set(userModel.user?.selectedsubjects ?? [])
                    userProfile.selectedGoals = userModel.user?.selectedgoals ?? []
                    userProfile.selectedHour = userModel.user?.selectedhour ?? 0
                    userProfile.selectedMinute = userModel.user?.selectedminute ?? 0
                    userProfile.selectedYear = userModel.user?.selectedyear ?? 0
                    
                        router.navigate(to: .EditFullName(dataModel: userProfile))
                }
                ProfileRow(title: "Preferred Name", value: userModel.user?.preferedname ?? "")
                    .onTapGesture {
                    var userProfile:SignUpModel = SignUpModel()
                    userProfile.fullname = userModel.user?.fullname ?? ""
                    userProfile.preferedName = userModel.user?.preferedname ?? ""
                    userProfile.username = userModel.user?.username ?? ""
                    userProfile.email = userModel.user?.email ?? ""
                    userProfile.selectedSubjects = Set(userModel.user?.selectedsubjects ?? [])
                    userProfile.selectedGoals = userModel.user?.selectedgoals ?? []
                    userProfile.selectedHour = userModel.user?.selectedhour ?? 0
                    userProfile.selectedMinute = userModel.user?.selectedminute ?? 0
                    userProfile.selectedYear = userModel.user?.selectedyear ?? 0
                    
                        router.navigate(to: .EditPreferedName(dataModel: userProfile))
                }
                ProfileRow(title: "Username", value: userModel.user?.username ?? "")
                    .onTapGesture {
                    var userProfile:SignUpModel = SignUpModel()
                    userProfile.fullname = userModel.user?.fullname ?? ""
                    userProfile.preferedName = userModel.user?.preferedname ?? ""
                    userProfile.username = userModel.user?.username ?? ""
                    userProfile.email = userModel.user?.email ?? ""
                    userProfile.selectedSubjects = Set(userModel.user?.selectedsubjects ?? [])
                    userProfile.selectedGoals = userModel.user?.selectedgoals ?? []
                    userProfile.selectedHour = userModel.user?.selectedhour ?? 0
                    userProfile.selectedMinute = userModel.user?.selectedminute ?? 0
                    userProfile.selectedYear = userModel.user?.selectedyear ?? 0
                    
                        router.navigate(to: .EditUsername(dataModel: userProfile))
                }
                ProfileRow(title: "Email Address", value: userModel.user?.email ?? "",isEditable: false)
                
                Divider()
                
                ProfileRow(title: "Year Group", value: "\(userModel.user?.selectedyear ?? 0)")
                    .onTapGesture {
                    var userProfile:SignUpModel = SignUpModel()
                    userProfile.fullname = userModel.user?.fullname ?? ""
                    userProfile.preferedName = userModel.user?.preferedname ?? ""
                    userProfile.username = userModel.user?.username ?? ""
                    userProfile.email = userModel.user?.email ?? ""
                    userProfile.selectedSubjects = Set(userModel.user?.selectedsubjects ?? [])
                    userProfile.selectedGoals = userModel.user?.selectedgoals ?? []
                    userProfile.selectedHour = userModel.user?.selectedhour ?? 0
                    userProfile.selectedMinute = userModel.user?.selectedminute ?? 0
                    userProfile.selectedYear = userModel.user?.selectedyear ?? 0
                    
                        router.navigate(to: .editYearGoal(dataModel: userProfile))
                }
                ProfileRow(title: "Subjects", value: "\(userModel.user?.selectedsubjects.count ?? 0)")
                    .onTapGesture {
                    var userProfile:SignUpModel = SignUpModel()
                    userProfile.fullname = userModel.user?.fullname ?? ""
                    userProfile.preferedName = userModel.user?.preferedname ?? ""
                    userProfile.username = userModel.user?.username ?? ""
                    userProfile.email = userModel.user?.email ?? ""
                    userProfile.selectedSubjects = Set(userModel.user?.selectedsubjects ?? [])
                    userProfile.selectedGoals = userModel.user?.selectedgoals ?? []
                    userProfile.selectedHour = userModel.user?.selectedhour ?? 0
                    userProfile.selectedMinute = userModel.user?.selectedminute ?? 0
                    userProfile.selectedYear = userModel.user?.selectedyear ?? 0
                    
                        router.navigate(to: .EditSubjectsSelection(dataModel: userProfile))
                }
                ProfileRow(title: "Academic Goals", value: "\(userModel.user?.selectedgoals.count ?? 0)")
                    .onTapGesture {
                    var userProfile:SignUpModel = SignUpModel()
                    userProfile.fullname = userModel.user?.fullname ?? ""
                    userProfile.preferedName = userModel.user?.preferedname ?? ""
                    userProfile.username = userModel.user?.username ?? ""
                    userProfile.email = userModel.user?.email ?? ""
                    userProfile.selectedSubjects = Set(userModel.user?.selectedsubjects ?? [])
                    userProfile.selectedGoals = userModel.user?.selectedgoals ?? []
                    userProfile.selectedHour = userModel.user?.selectedhour ?? 0
                    userProfile.selectedMinute = userModel.user?.selectedminute ?? 0
                    userProfile.selectedYear = userModel.user?.selectedyear ?? 0
                    
                        router.navigate(to: .EditGoalSelection(dataModel: userProfile))
                }
                ProfileRow(title: "Daily Goal", value: "\(userModel.user?.selectedhour ?? 0)Hr \(userModel.user?.selectedminute ?? 0)m")
                    .onTapGesture {
                    var userProfile:SignUpModel = SignUpModel()
                    userProfile.fullname = userModel.user?.fullname ?? ""
                    userProfile.preferedName = userModel.user?.preferedname ?? ""
                    userProfile.username = userModel.user?.username ?? ""
                    userProfile.email = userModel.user?.email ?? ""
                    userProfile.selectedSubjects = Set(userModel.user?.selectedsubjects ?? [])
                    userProfile.selectedGoals = userModel.user?.selectedgoals ?? []
                    userProfile.selectedHour = userModel.user?.selectedhour ?? 0
                    userProfile.selectedMinute = userModel.user?.selectedminute ?? 0
                    userProfile.selectedYear = userModel.user?.selectedyear ?? 0
                    
                        router.navigate(to: .EditDailyHours(dataModel: userProfile))
                }
                
                Spacer()
                
//                HStack{
//                    Spacer()
//                    Button(action: {
//                    }) {
//                        Text("Submit")
//                            .foregroundColor(.white)
//                            .mitrFont(.headline, weight: .regular)
//                            .frame(width: 150, height: 15)
//                            .padding()
//                            .background(Color.efficioblue)
//                            .cornerRadius(15)
//                            .padding(.horizontal)
//                    }
//                    .padding(.horizontal)
//                    .padding(.bottom, 25)
//
//                    Spacer()
//                }
            }
            .padding(.top, 70)
            .padding(.horizontal)
            .background(Color.white)
            .cornerRadius(20)
            .zIndex(0)
        }
        .edgesIgnoringSafeArea(.top)
        .sheet(isPresented: $showingImagePicker) {
            ImagePicker(image: $profileImage)
        }
        .onAppear {
            userModel.fetchUser()
        }
    }
}

struct ProfileRow: View {
    let title: String
    let value: String
    var isEditable:Bool = true
    @State var isEditMode:Bool = false
    var body: some View {
        HStack {
            Text(title)
                .mitrFont(.subheadline, weight: .regular)
            Spacer()
            
            Text(value)
                .mitrFont(.subheadline, weight: .regular)
                .foregroundColor(.efficioblue)
            if isEditable {
                Image(systemName: "chevron.right")
                    .foregroundColor(.gray)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}

// Image Picker for selecting a new profile picture
struct ImagePicker: UIViewControllerRepresentable {
    @Binding var image: UIImage?

    func makeUIViewController(context: Context) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.delegate = context.coordinator
        return picker
    }

    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {}

    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        let parent: ImagePicker

        init(_ parent: ImagePicker) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            if let uiImage = info[.originalImage] as? UIImage {
                parent.image = uiImage
            }
            picker.dismiss(animated: true)
        }
    }
}
