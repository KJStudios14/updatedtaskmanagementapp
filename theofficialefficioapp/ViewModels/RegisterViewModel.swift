//
//  RegisterViewModel.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 30/09/24.
//
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class RegisterViewModel: ObservableObject {
    
    @Published var errorMessage = ""
    @Published var isValidated: Bool = false
    @Published var dataModel: SignUpModel = SignUpModel()
    
    var onRegister: ((Bool) -> Void)?
    
    init() {
        
    }
    
    
    func register()  {

        Auth.auth().createUser(withEmail: dataModel.email, password: dataModel.password) { [weak self] authResult, error in
            
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
                "fullname": dataModel.fullname,
                "username": dataModel.username,
                "email": dataModel.email,
                "joined": Date().timeIntervalSince1970,
                "preferedname": dataModel.preferedName,
                "selectedyear": dataModel.selectedYear,
                "selectedhour": dataModel.selectedHour,
                "selectedminute": dataModel.selectedMinute,
                "selectedsubjects": Array(dataModel.selectedSubjects),
                "selectedgoals": dataModel.selectedGoals
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
    
}
