//
//  ToDoViewModel.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import FirebaseFirestore
import Foundation

class ToDoViewModel: ObservableObject {
    @Published var showingNewItemView = false
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete { error in
                if let error = error {
                    print("Error deleting document: \(error)")
                } else {
                    print("Document successfully deleted!")
                }
            }
    }
}
