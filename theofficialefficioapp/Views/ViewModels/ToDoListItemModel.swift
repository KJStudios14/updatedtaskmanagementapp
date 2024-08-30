//
//  ProfileViewModel.swift
//  theofficialefficioapp
//
//  Created by KJemide on 12/08/2024.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoListItemViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        // Create a reference to the Firestore database
        let db = Firestore.firestore()
        
        // Create a reference to the specific document for the ToDoListItem
        guard let uid = Auth.auth().currentUser?.uid else {
            print("User is not authenticated")
            return
        }
        
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(item.id)
            .updateData(["isDone": !item.isDone]) { error in
                if let error = error {
                    print("Error updating document: \(error)")
                } else {
                    print("Document successfully updated!")
                }
            }
    }
}

