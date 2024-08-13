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
        var itemCopy = item
        itemCopy.setDone(!item.isDone) // Toggle the isDone state
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        do {
            try db.collection("users")
                .document(uid)
                .collection("todos")
                .document(itemCopy.id)
                .setData(from: itemCopy)
        } catch {
            print("Error setting document: \(error)")
        }
    }
}


/* class ProfileViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: ToDoListItem) {
        var itemCopy = item
        itemCopy.setDone(item.isDone)
        
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        db.collection("users")
            .document(uid)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
        
    }
} CODE FROM TUTORIAL, CHATGPT CODE BELOW*/
