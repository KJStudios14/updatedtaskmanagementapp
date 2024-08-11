//
//  LogInViewModel.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import Foundation

class LogInViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var errorMessage = ""
    
    init() {}
    
    func login(){
        errorMessage = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            
            errorMessage = "Please enter your email and password."
            return
        }
        guard email.contains("@") && email.contains(".") else {
            errorMessage = "Please enter valid email."
            return
        }
        print("Called")
    }
    
    func validate() {
        
    }
}

