
import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignUpViewModel: ObservableObject {
    @Published var fullname = ""
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            return
        }

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                self?.errorMessage = "Error creating user: \(error.localizedDescription)"
                return
            }

            guard let user = authResult?.user else {
                print("Failed to get the user after registration.")
                self?.errorMessage = "Failed to get user after registration."
                return
            }

            let db = Firestore.firestore()
            guard let self = self else { return }
            let userData: [String: Any] = [
                "id": user.uid,
                "fullname": self.fullname,
                "username": self.username,
                "email": self.email,
                "joined": Date().timeIntervalSince1970
            ]

            db.collection("users").document(user.uid).setData(userData) { error in
                if let error = error {
                    print("Error saving user data: \(error.localizedDescription)")
                    self.errorMessage = "Error saving user data: \(error.localizedDescription)"
                } else {
                    print("User data saved successfully.")
                    self.errorMessage = ""
                }
            }
        }
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !fullname.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            return false
        }
        
        guard fullname.count >= 2 else {
            errorMessage = "Please enter a valid full name."
            return false
        }
        
        guard username.count >= 6 else {
            errorMessage = "Username must be a minimum of 6 characters."
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            return false
        }
        
        guard password.count >= 8 else {
            errorMessage = "Password must be a minimum of 8 characters."
            return false
        }
        
        return true
    }
}
