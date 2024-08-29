
import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    var priority: Priority // Ensure this property exists
    
    enum Priority: String, Codable {
        case none
        case low
        case medium
        case high
    }
}
