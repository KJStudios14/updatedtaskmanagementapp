

import FirebaseAuth
import FirebaseFirestore
import Foundation


class UserViewModel: ObservableObject {
    
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("No user logged in")
            return
        }
        print("Fetching user with ID: \(userId)")
        
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self?.user = User(id: data["id"] as? String ?? "",
                                  fullname: data["fullname"] as? String ?? "",
                                  username: data["username"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  joined: data["joined"] as? TimeInterval ?? 0,
                                  preferedname: data["preferedname"] as? String ?? "",
                                  selectedhour: data["selectedhour"] as? Int ?? 0,
                                  selectedminute: data["selectedminute"] as? Int ?? 0,
                                  selectedyear: data["selectedyear"] as? Int ?? 0,
                                  selectedgoals: data["selectedgoals"] as? [String] ?? [],
                                  selectedsubjects: data["selectedsubjects"] as? [String] ?? [])
                
            }
        }
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error)
        }
        
    }
}
