
import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignUpViewModel: ObservableObject {
    @Published var fullname = ""
    @Published var preferedName = ""
    @Published var selectedYear:Int = 7
    @Published var username = ""
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    @Published var isValidated: Bool = false
    @Published var selectedSubjects: Set<String> = []
    @Published var selectedGoals: [String] = []
    @Published var selectedHour = 1
    @Published var selectedMinute = 0
    
    var onRegister: ((Bool) -> Void)?
    var onValidated: ((Bool) -> Void)?
    
    init() {
        isValidated = false
    }
    
    
    func register()  {

        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            
            if let error = error {
                print("Error creating user: \(error.localizedDescription)")
                self?.errorMessage = "Error creating user: \(error.localizedDescription)"
                self!.onRegister?(false)
                return
            }
            guard let user = authResult?.user else {
                print("Failed to get the user after registration.")
                self?.errorMessage = "Failed to get user after registration."
                self!.onRegister?(false)
                return
            }

            let db = Firestore.firestore()
            guard let self = self else { return }
            let userData: [String: Any] = [
                "id": user.uid,
                "fullname": self.fullname,
                "username": self.username,
                "email": self.email,
                "joined": Date().timeIntervalSince1970,
                "preferedname": preferedName,
                "selectedyear": selectedYear,
                "selectedhour": selectedHour,
                "selectedminute": selectedMinute,
                "selectedsubjects": Array(selectedSubjects),
                "selectedgoals": selectedGoals
            ]

            db.collection("users").document(user.uid).setData(userData) { error in
                if let error = error {
                    print("Error saving user data: \(error.localizedDescription)")
                    self.errorMessage = "Error saving user data: \(error.localizedDescription)"
                    self.onRegister?(false)
                } else {
                    print("User data saved successfully.")
                    self.errorMessage = ""
                    self.onRegister?(true)
                }
            }
        }
    }
    
    func validate() {
        errorMessage = ""
        guard !fullname.trimmingCharacters(in: .whitespaces).isEmpty,
              !username.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            self.onValidated?(false)
            return
        }
        
        guard fullname.count >= 2 else {
            errorMessage = "Please enter a valid full name."
            self.onValidated?(false)
            return
        }
        
        guard username.count >= 6 else {
            errorMessage = "Username must be a minimum of 6 characters."
            self.onValidated?(false)
            return
        }
        
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            self.onValidated?(false)
            return
        }
        
        guard password.count >= 8 else {
            errorMessage = "Password must be a minimum of 8 characters."
            self.onValidated?(false)
            return
        }
        
        self.onValidated?(true)
    }
}
