

import SwiftUI

struct EditSubjectSelectionView: View {
 

    @State private var showAlert: Bool = false
    @StateObject var viewModel = ProfileEditModel()
    @State var dataModel:SignUpModel
    @EnvironmentObject var router: Router
    
    let subjects = [
        "Maths", "English Language", "English Literature", "Biology", "Chemistry",
        "Physics", "Geography", "History", "RS", "Computer Science",
        "Economics", "Philosophy", "Further Maths", "French",
        "Spanish", "German", "Latin", "Other"
    ]
    
    var body: some View {
            VStack {
                Spacer()
                
                Text("Please update all your subjects.")
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
                            if dataModel.selectedSubjects.contains(subject) {
                                dataModel.selectedSubjects.remove(subject)
                            } else {
                                dataModel.selectedSubjects.insert(subject)
                            }
                        }) {
                            Text(subject)
                                .mitrFont(.caption, weight: .regular)
                                .multilineTextAlignment(.center)
                                .foregroundColor(dataModel.selectedSubjects.contains(subject) ? Color.white : Color.efficioblue)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .padding(.vertical, 10)
                                .frame(maxWidth: 100)
                                .background(dataModel.selectedSubjects.contains(subject) ? Color.efficioblue : Color.clear)
                                .cornerRadius(15)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 15)
                                        .stroke(dataModel.selectedSubjects.contains(subject) ? Color.efficioblue : Color.efficioblue, lineWidth: 2)
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
                        if dataModel.selectedSubjects.contains("Other"){
                            router.navigate(to: .EditOtherSubjectsSelection(dataModel: dataModel))
                        }else{
                            viewModel.UpdateProfile()
                        }
                        }
                   label:{
                        Text("Update")
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                   .disabled(dataModel.selectedSubjects.isEmpty)
                   .opacity(dataModel.selectedSubjects.isEmpty ? 0.5 : 1.0)
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text("Please select at least one subject."), dismissButton: .default(Text("OK")))
                    }
                    
                    Button {
                        router.navigateBack()
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
                .onAppear {
                    viewModel.onUpdate = { isSuccess in
                        router.navigateBack()
                    }
                }
            }.navigationBarBackButtonHidden()
    }
}

//#Preview {
//    SubjectSelectionView(dataModel:SignUpViewModel())
//}
