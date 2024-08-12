//
//  NewItemViewModel.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewItemViewModel: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    @Published var dueDate = Date()
    @Published var showAlert = false
    
    init() {}
    
    func addtask() {
        guard canSave else {
            return
        }
        
        // Get current user id
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        
        // Create model
        let newId = UUID().uuidString
        let newItem = ToDoListItem(
            id: newId,
            title: title,
            description: description,
            dueDate: dueDate.timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false
        )
        
        // Save model
        let db = Firestore.firestore()
        db.collection("users")
            .document(uId)
            .collection("todos")
            .document(newId)
            .setData(newItem.asDictionary()) { error in
                if let error = error {
                    print("Error writing document: \(error)")
                } else {
                    print("Document successfully written!")
                }
            }
    }
    
    var canSave: Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
}
