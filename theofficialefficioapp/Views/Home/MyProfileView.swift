

import SwiftUI
import UIKit

struct MyProfileView: View {
    @State private var showingImagePicker = false
    @State private var profileImage: UIImage? = nil

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
                ProfileRow(title: "Full name", value: "{{fullName}}")
                ProfileRow(title: "Preferred Name", value: "{{preferredName}}")
                ProfileRow(title: "Username", value: "{{userName}}")
                ProfileRow(title: "Email Address", value: "{{userEmail}}")
                ProfileRow(title: "Password", value: "**********")
                
                Divider()
                
                ProfileRow(title: "Year Group", value: "{{yearGroup}}")
                ProfileRow(title: "Subjects", value: "{{userSubjects}}")
                ProfileRow(title: "Academic Goals", value: "{{userAcademicGoals}}")
                ProfileRow(title: "Daily Goal", value: "{{userDailyGoal}}")
                
                Spacer()
                
                HStack{
                    Spacer()
                    Button(action: {
                    }) {
                        Text("Submit")
                            .foregroundColor(.white)
                            .mitrFont(.headline, weight: .regular)
                            .frame(width: 150, height: 15)
                            .padding()
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                            .padding(.horizontal)
                    }
                    .padding(.horizontal)
                    .padding(.bottom, 25)

                    Spacer()
                }
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
    }
}

struct ProfileRow: View {
    let title: String
    let value: String
    
    var body: some View {
        HStack {
            Text(title)
                .mitrFont(.subheadline, weight: .regular)
            Spacer()
            Text(value)
                .mitrFont(.subheadline, weight: .regular)
                .foregroundColor(.efficioblue)
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
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
