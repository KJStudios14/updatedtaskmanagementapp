
import FirebaseAuth
import FirebaseFirestore
import Foundation

class SignUpViewModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var isValidated: Bool = false
    @Published var dataModel: SignUpModel = SignUpModel()
    
    
    var onValidated: ((Bool) -> Void)?
    
    init() {
        isValidated = false
    }
    
    func validate() {
        errorMessage = ""
        guard !dataModel.fullname.trimmingCharacters(in: .whitespaces).isEmpty,
              !dataModel.username.trimmingCharacters(in: .whitespaces).isEmpty,
              !dataModel.password.trimmingCharacters(in: .whitespaces).isEmpty,
              !dataModel.email.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            self.onValidated?(false)
            return
        }
        
        guard dataModel.fullname.count >= 2 else {
            errorMessage = "Please enter a valid full name."
            self.onValidated?(false)
            return
        }
        
        guard dataModel.username.count >= 6 else {
            errorMessage = "Username must be a minimum of 6 characters."
            self.onValidated?(false)
            return
        }
        
        guard dataModel.email.contains("@") && dataModel.email.contains(".") else {
            errorMessage = "Please enter a valid email address."
            self.onValidated?(false)
            return
        }
        
        guard dataModel.password.count >= 8 else {
            errorMessage = "Password must be a minimum of 8 characters."
            self.onValidated?(false)
            return
        }
        
        self.onValidated?(true)
    }
}
