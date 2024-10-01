//
//  FirebaseDataModel.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 01/10/24.
//

import Firebase
import FirebaseFirestore
import FirebaseAuth

class FirebaseManager {
    static let shared = FirebaseManager()
    
    let auth: Auth
    let firestore: Firestore
    
    // Private initializer to prevent others from instantiating the class
    private init() {
        
        self.auth = Auth.auth()
        self.firestore = Firestore.firestore()
    }
    
    // Function to get the current user's ID
    func getCurrentUserID() -> String? {
        return auth.currentUser?.uid
    }
    
    // Function to log in the user (assuming email & password login for this example)
    func loginUser(email: String, password: String, completion: @escaping (Result<String, Error>) -> Void) {
        auth.signIn(withEmail: email, password: password) { (result, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let userID = result?.user.uid {
                completion(.success(userID))
            }
        }
    }
    
    // Fetch Firestore data based on logged-in user ID
    func fetchUserData(completion: @escaping (Result<[String: Any], Error>) -> Void) {
        guard let userID = getCurrentUserID() else {
            completion(.failure(NSError(domain: "No User Logged In", code: 401, userInfo: nil)))
            return
        }
        
        firestore.collection("users").document(userID).getDocument { (document, error) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let document = document, document.exists, let data = document.data() {
                completion(.success(data))
            } else {
                completion(.failure(NSError(domain: "No Document Found", code: 404, userInfo: nil)))
            }
        }
    }
}
