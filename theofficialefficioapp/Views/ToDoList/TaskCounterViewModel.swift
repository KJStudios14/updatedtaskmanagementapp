

import FirebaseAuth
import FirebaseFirestore
import Foundation

class TaskCounterViewModel: ObservableObject {
    @Published var completedTasks: Int = 0
    
    private var db = Firestore.firestore()
    private var userId: String?
    
    init() {
        self.userId = Auth.auth().currentUser?.uid
    }
    
    func fetchCompletedTasks() {
        guard let uid = userId else {
            print("User is not authenticated")
            return
        }
        
        let today = DateFormatter.localizedString(from: Date(), dateStyle: .short, timeStyle: .none)
        let statsRef = db.collection("users").document(uid).collection("todos").document(today)
        
        statsRef.getDocument { (document, error) in
            if let document = document, document.exists {
                self.completedTasks = document.data()?["completedTasks"] as? Int ?? 0
            } else {
                self.completedTasks = 0
            }
        }
    }
}
