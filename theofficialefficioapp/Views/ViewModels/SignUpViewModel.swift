//
//  SignUpViewModel.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import FirebaseFirestore
import FirebaseAuth
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
        
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(
            id: id,
            fullname: fullname,
            username: username,
            email: email,
            joined: Date().timeIntervalSince1970
        )
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary()) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
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
