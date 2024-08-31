

import SwiftUI
import Firebase

struct NotesView: View {
    @ObservedObject var notes = getNotes()
    @State var show = false
    @State var txt = ""
    @State var docID = ""
    @State var remove = false
    @State private var showDeleteAlert = false
    @State private var noteToDelete: Note?
    @State private var searchText = ""
    
    var filteredNotes: [Note] {
        if searchText.isEmpty {
            return notes.data
        } else {
            return notes.data.filter { $0.note.lowercased().contains(searchText.lowercased()) }
        }
    }

    var body: some View {
        
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
                
                SearchBarView(text: $searchText, placeholder: "Search notes...") // Corrected view name
                
                if self.filteredNotes.isEmpty {
                    if self.notes.noData {
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
                            ForEach(self.filteredNotes) { i in
                                HStack(spacing: 15) {
                                    Button(action: {
                                        self.docID = i.id
                                        self.txt = i.note
                                        self.show.toggle()
                                    }) {
                                        VStack(alignment: .leading, spacing: 15) {
                                            Text(i.note).lineLimit(1)
                                                .mitrFont(.subheadline, weight: .regular)
                                                .padding(.bottom, -10)
                                            HStack {
                                                Text(i.date)
                                                Spacer()
                                                Text(i.time)
                                            }
                                            .mitrFont(.caption, weight: .light)
                                            Divider()
                                        }
                                        .padding(.top, 15)
                                        .foregroundColor(.black)
                                    }
                                    if self.remove {
                                        Button(action: {
                                            self.noteToDelete = i // Set the note to be deleted
                                            self.showDeleteAlert = true // Show the delete confirmation alert
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
                            .padding(.bottom, -10)
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
        .alert(isPresented: $showDeleteAlert) { // Add the alert view
            Alert(
                title: Text("Delete Note"),
                message: Text("Are you sure you want to delete this note?"),
                primaryButton: .destructive(Text("Delete")) {
                    // Perform the delete action
                    if let note = self.noteToDelete {
                        let db = Firestore.firestore()
                        db.collection("notes").document(note.id).delete { error in
                            if let error = error {
                                print("Error deleting document: \(error.localizedDescription)")
                            } else {
                                print("Document successfully deleted")
                            }
                        }
                    }
                },
                secondaryButton: .cancel()
            )
        }
        .animation(.default)
    }
}

#Preview {
    NotesView()
}
