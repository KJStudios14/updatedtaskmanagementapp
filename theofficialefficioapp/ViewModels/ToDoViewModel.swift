

import FirebaseAuth
import FirebaseFirestore
import Foundation

class ToDoViewModel: ObservableObject {
    @Published var showingNewItemView = false
    @Published var sortBy: SortCriterion = .dueDate
    @Published var showDeleteConfirmation = false // State for delete confirmation
    @Published var itemToDelete: ToDoListItem? // Item to delete
    @Published var selectedItem: ToDoListItem?
    @Published var firebaseObj: FirebaseManager = FirebaseManager.shared
    private var userId: String?
    
    enum SortCriterion {
        case dueDate
        case priority
    }
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete() {
        guard let userid  = userId else { return }
        guard let item = itemToDelete else { return }
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userid)
            .collection("todos")
            .document(item.id)
            .delete { error in
                if let error = error {
                    print("Error deleting document: \(error)")
                } else {
                    print("Document successfully deleted!")
                }
            }
        
        // Reset the state
        itemToDelete = nil
        showDeleteConfirmation = false
    }
    
    func toggleIsDone(item: ToDoListItem) {
        guard let userid  = userId else { return }
        let db = Firestore.firestore()
        
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
    
    func sortedItems(_ items: [ToDoListItem]) -> [ToDoListItem] {
        switch sortBy {
        case .dueDate:
            return items.sorted { (item1: ToDoListItem, item2: ToDoListItem) in
                item1.dueDate < item2.dueDate
            }
        case .priority:
            return items.sorted { (item1: ToDoListItem, item2: ToDoListItem) in
                item1.priority.priorityOrder < item2.priority.priorityOrder
            }
        }
    }
    func sortedTodayItems(_ items: [ToDoListItem]) -> [ToDoListItem] {
        
        return items.filter{ item in
            Date(timeIntervalSince1970: item.dueDate).DateToString() == Date().DateToString()
        }
        
    }
}

extension ToDoListItem.Priority {
    var priorityOrder: Int {
        switch self {
        case .high:
            return 0
        case .medium:
            return 1
        case .low:
            return 2
        case .none:
            return 3
        }
    }
}

