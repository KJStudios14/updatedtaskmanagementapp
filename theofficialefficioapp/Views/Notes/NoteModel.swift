

import Foundation
import Firebase

struct Note : Identifiable {
    var id : String
    var note : String
    var date : String
}

class getNotes : ObservableObject {
    
    @Published var data = [Note]()
    @Published var noData = false
    
    init() {
        let db = Firestore.firestore()
        
        db.collection("notes").order(by: "date", descending: false).addSnapshotListener { (snap, err) in
            if let err = err {
                print((err.localizedDescription))
                self.noData = true
                return
            }
            
            if snap?.documentChanges.isEmpty ?? true {
                self.noData = true
                return
            }
            
            for i in snap!.documentChanges {
                if i.type == .added {
                    let id = i.document.documentID
                    let notes = i.document.get("notes") as! String
                    let date = i.document.get("date") as! Timestamp
                    let format = DateFormatter()
                    format.dateFormat = "dd-MM-YY hh:mm a"
                    let dateString = format.string(from: date.dateValue())
                    self.data.append(Note(id: id, note: notes, date: dateString))
                }
                
                if i.type == .modified {
                    let id = i.document.documentID
                    let notes = i.document.get("notes") as! String
                    for j in 0..<self.data.count {
                        if self.data[j].id == id {
                            self.data[j].note = notes
                        }
                    }
                }
                
                if i.type == .removed {
                    let id = i.document.documentID
                    for j in 0..<self.data.count {
                        if self.data[j].id == id {
                            self.data.remove(at: j)
                            if self.data.isEmpty {
                                self.noData = true
                            }
                            return
                        }
                    }
                }
            }
        }
    }
}
