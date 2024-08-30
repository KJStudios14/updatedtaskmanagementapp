

import SwiftUI

struct SubjectSelectionView: View {
    @State private var selectedSubjects: Set<String> = []
    @State private var showAlert: Bool = false
    
    let subjects = [
        "Maths", "English Language", "English Literature", "Biology", "Chemistry",
        "Physics", "Geography", "History", "RS", "Computer Science",
        "Economics", "Philosophy", "Further Maths", "French",
        "Spanish", "German", "Latin", "Other"
    ]
    
    var body: some View {
        VStack {
            Spacer()
            
            Text("Please select all your subjects.")
                .mitrFont(.title2, weight: .medium)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .foregroundColor(Color.efficioblue)
                .padding(.top, 30)
                .padding(.bottom, 30)
                .padding(.horizontal, 5)
            
            let columns = [GridItem(.adaptive(minimum: 100))]
            LazyVGrid(columns: columns, spacing: 15) {
                ForEach(subjects, id: \.self) { subject in
                    Button(action: {
                        if selectedSubjects.contains(subject) {
                            selectedSubjects.remove(subject)
                        } else {
                            selectedSubjects.insert(subject)
                        }
                    }) {
                        Text(subject)
                            .mitrFont(.caption, weight: .regular)
                            .multilineTextAlignment(.center)
                            .foregroundColor(selectedSubjects.contains(subject) ? Color.white : Color.efficioblue)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 10)
                            .frame(maxWidth: 100)
                            .background(selectedSubjects.contains(subject) ? Color.efficioblue : Color.clear)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(selectedSubjects.contains(subject) ? Color.efficioblue : Color.efficioblue, lineWidth: 2)
                            )
                            .frame(height: 60)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal, 10)
            
            Spacer()
            
            VStack {
                Button(action: {
                    if selectedSubjects.isEmpty {
                        showAlert = true
                    } else {
                        // Navigate to the next view
                    }
                }) {
                    Text("Next")
                        .foregroundColor(.white)
                        .frame(width: 225, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(15)
                }
                .alert(isPresented: $showAlert) {
                    Alert(title: Text("Error"), message: Text("Please select at least one subject."), dismissButton: .default(Text("OK")))
                }
                
                NavigationLink {
                    YearGroupSelectionView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Back")
                        .foregroundColor(.efficioblue)
                        .frame(width: 225, height: 44)
                        .background(Color.white)
                        .cornerRadius(15)
                        .overlay(
                            RoundedRectangle(cornerRadius: 15)
                                .stroke(Color.efficioblue, lineWidth: 2)
                        )
                }
            }
            .mitrFont(.subheadline, weight: .regular)
            .fontWeight(.semibold)
            .padding(.vertical, 50)
        }
    }
}

#Preview {
    SubjectSelectionView()
}
