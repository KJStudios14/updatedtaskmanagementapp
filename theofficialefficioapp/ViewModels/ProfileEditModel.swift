//
//  ProfileEditModel.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 03/10/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ProfileEditModel: ObservableObject {
    @Published var errorMessage = ""
    @Published var isValidated: Bool = false
    @Published var dataModel: SignUpModel = SignUpModel()
    
    
    var onUpdate: ((Bool) -> Void)?
    
    init() {
        isValidated = false
    }
    func UpdateProfile(){
        errorMessage = ""
        guard !dataModel.fullname.trimmingCharacters(in: .whitespaces).isEmpty,
              !dataModel.username.trimmingCharacters(in: .whitespaces).isEmpty else {
            errorMessage = "Please fill in all fields."
            self.onUpdate?(false)
            return
        }
        
        guard dataModel.fullname.count >= 2 else {
            errorMessage = "Please enter a valid full name."
            self.onUpdate?(false)
            return
        }
        
        guard dataModel.username.count >= 6 else {
            errorMessage = "Username must be a minimum of 6 characters."
            self.onUpdate?(false)
            return
        }
        
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No user logged in")
            return
        }
        print("Fetching user with ID: \(userId)")
        
        let db = Firestore.firestore()
        let userData: [String: Any] = [
            "fullname": dataModel.fullname,
            "username": dataModel.username,
            "preferedname": dataModel.preferedName,
            "selectedyear": dataModel.selectedYear,
            "selectedhour": dataModel.selectedHour,
            "selectedminute": dataModel.selectedMinute,
            "selectedsubjects": Array(dataModel.selectedSubjects),
            "selectedgoals": dataModel.selectedGoals
        ]
        db.collection("users").document(userId).setData(userData){ error in
            if let error = error {
                print("Error saving user data: \(error.localizedDescription)")
                self.errorMessage = "Error saving user data: \(error.localizedDescription)"
                self.onUpdate?(false)
            } else {
                print("User data saved successfully.")
                self.errorMessage = ""
                self.onUpdate?(true)
            }
        }
    }
    
}
