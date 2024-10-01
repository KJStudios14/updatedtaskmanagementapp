

import Foundation
import Firebase
import FirebaseAuth


struct Note : Identifiable {
    var id : String
    var note : String
    var date : String
    var time: String
}

class getNotes : ObservableObject {
    
    @Published var data = [Note]()
    @Published var noData = false
    
    init() {
        let db = Firestore.firestore()
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        db.collection("users")
          .document(uId)
          .collection("notes").order(by: "date", descending: false).addSnapshotListener { (snap, err) in
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
                    
                    // Split date into date and time components
                    format.dateFormat = "dd-MM-YY"
                    let dateString = format.string(from: date.dateValue())
                    
                    format.dateFormat = "hh:mm a"
                    let timeString = format.string(from: date.dateValue())
                    
                    self.data.append(Note(id: id, note: notes, date: dateString, time: timeString))
                }
                
                if i.type == .modified {
                    let id = i.document.documentID
                    let notes = i.document.get("notes") as! String
                    let date = i.document.get("date") as! Timestamp
                    let format = DateFormatter()
                    
                    // Split date into date and time components
                    format.dateFormat = "dd-MM-YY"
                    let dateString = format.string(from: date.dateValue())
                    
                    format.dateFormat = "hh:mm a"
                    let timeString = format.string(from: date.dateValue())
                    
                    for j in 0..<self.data.count {
                        if self.data[j].id == id {
                            self.data[j].note = notes
                            self.data[j].date = dateString
                            self.data[j].time = timeString
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


