

import SwiftUI

struct SubjectSelectionView: View {
    @Binding var path: [String] 
    
    @State private var selectedSubjects: Set<String> = []
    @State private var showAlert: Bool = false
    @StateObject public var viewModel:SignUpViewModel
    
    let subjects = [
        "Maths", "English Language", "English Literature", "Biology", "Chemistry",
        "Physics", "Geography", "History", "RS", "Computer Science",
        "Economics", "Philosophy", "Further Maths", "French",
        "Spanish", "German", "Latin", "Other"
    ]
    
    var body: some View {
        NavigationStack(path: $path) {
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
                                viewModel.selectedSubjects = selectedSubjects
                            } else {
                                selectedSubjects.insert(subject)
                                viewModel.selectedSubjects = selectedSubjects
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
                    Button{
                                if selectedSubjects.contains("Other"){
                                    path.append("OtherSubjectView")
                                }else{
                                    path.append("GoalSelectionView")
                                }
                        }
                   label:{
                        Text("Next")
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                    .disabled(selectedSubjects.isEmpty)
                    .opacity(selectedSubjects.isEmpty ? 0.5 : 1.0)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text("Please select at least one subject."), dismissButton: .default(Text("OK")))
                    }
                    
                    Button {
                        path.removeLast()
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
            .navigationDestination(for: String.self) { value in
                if value == "OtherSubjectView" {
                    OtherSubjectsView(path: $path, viewModel: viewModel)
                }else if value == "GoalSelection" {
                    GoalSelectionView(path: $path, viewModel: viewModel)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

//#Preview {
//    SubjectSelectionView(viewModel:SignUpViewModel())
//}
