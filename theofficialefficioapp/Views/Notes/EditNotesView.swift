

import SwiftUI
import Firebase
import FirebaseAuth

struct EditNotesView : View {
    
    @Binding var txt : String
    @Binding var docID : String
    @Binding var show : Bool
    
    var body : some View{
        
        ZStack(alignment: .bottomTrailing) {
            
            MultiLineTF(txt: self.$txt)
                .padding()
                .background(Color.black.opacity(0.05))
            
            Button(action: {
                self.show.toggle()
                self.SaveData()
            }) {
                Text("Save")
                    .padding(.vertical)
                    .padding(.horizontal, 25)
                    .foregroundColor(.white)
            }
            .background(Color.efficioblue)
            .clipShape(Capsule())
            .padding()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
    
    func SaveData(){
        let db = Firestore.firestore()
        
        guard let uId = Auth.auth().currentUser?.uid else {
            return
        }
        if self.docID != ""{
            db.collection("users")
            .document(uId)
                .collection("notes")
                .document(self.docID).updateData(["notes": self.txt]) { err in
                if let err = err {
                    print((err.localizedDescription))
                    return
                }
            }
        } else {
            db.collection("users")
                .document(uId)
                .collection("notes")
                .document().setData(["notes": self.txt, "date": Date()]) { err in
                if let err = err {
                    print((err.localizedDescription))
                    return
                }
            }
        }
    }
}
