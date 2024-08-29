


import SwiftUI
import Firebase

struct NotesView: View {
    @ObservedObject var Notes = getNotes()
    @State var show = false
    @State var txt = ""
    @State var docID = ""
    @State var remove = false
    
    var body : some View{
        
        ZStack(alignment: .bottomTrailing) {
            
            VStack(spacing: 0){
                
                HStack{
                    Text("Notes")
                        .mitrFont(.title, weight: .semibold)
                        .foregroundColor(.white)
                    Spacer()
                    Button(action: {
                        self.remove.toggle()
                    }) {
                        Image(systemName: self.remove ? "xmark.circle" : "trash")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .padding(.top, UIApplication.shared.windows.first?.safeAreaInsets.top)
                .background(Color.efficioblue)
                
                if self.Notes.data.isEmpty {
                    if self.Notes.noData {
                        Spacer()
                        Text("No Notes !!!")
                        
                        Spacer()
                    } else {
                        Spacer()
                        Indicator()
                        Spacer()
                    }
                } else {
                    ScrollView(.vertical, showsIndicators: false) {
                        VStack {
                            ForEach(self.Notes.data) { i in
                                HStack(spacing: 15) {
                                    Button(action: {
                                        self.docID = i.id
                                        self.txt = i.note
                                        self.show.toggle()
                                    }) {
                                        VStack(alignment: .leading, spacing: 12) {
                                            Text(i.date)
                                            Text(i.note).lineLimit(1)
                                            Divider()
                                        }
                                        .padding(10)
                                        .foregroundColor(.black)
                                    }
                                    if self.remove {
                                        Button(action: {
                                            let db = Firestore.firestore()
                                            db.collection("notes").document(i.id).delete { error in
                                                if let error = error {
                                                    print("Error deleting document: \(error.localizedDescription)")
                                                } else {
                                                    print("Document successfully deleted")
                                                }
                                            }
                                        }) {
                                            Image(systemName: "minus.circle.fill")
                                                .resizable()
                                                .frame(width: 20, height: 20)
                                                .foregroundColor(.efficioblue)
                                        }
                                    }
                                }
                                .padding(.horizontal)
                            }
                        }
                    }
                }
            }
            .edgesIgnoringSafeArea(.top)
            
            Button(action: {
                self.txt = ""
                self.docID = ""
                self.show.toggle()
            }) {
                Image(systemName: "plus")
                    .resizable()
                    .frame(width: 18, height: 18)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color.efficioblue)
            .clipShape(Circle())
            .padding()
        }
        .sheet(isPresented: self.$show) {
            EditNotesView(txt: self.$txt, docID: self.$docID, show: self.$show)
        }
        .animation(.default)
    }
}

#Preview {
    NotesView()
}
