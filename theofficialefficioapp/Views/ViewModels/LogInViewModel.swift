//
//  LogInViewModel.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import FirebaseAuth
import Foundation

class LogInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login(){
        guard validate() else{
            return
        }
        Auth.auth().signIn(withEmail: email, password: password)
    }
    
    private func validate() -> Bool {
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please enter your email and password."
            return false
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email address."
            return false
        }
        return true
        
        
    }
}

