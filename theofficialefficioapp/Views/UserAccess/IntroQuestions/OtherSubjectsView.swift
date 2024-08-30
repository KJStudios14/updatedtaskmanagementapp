


import SwiftUI

struct OtherSubjectsView: View {
    @State private var subjects: [String] = [""]
    
    var body: some View {
        
        
        VStack {
            
            VStack {
                Spacer()
                
                Text("Please enter your other subjects.")
                    .mitrFont(.title2, weight: .medium)
                    .foregroundColor(Color(.efficioblue))
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                
                Text("Type in any subjects that we have not mentioned.")
                    .mitrFont(.subheadline, weight: .regular)
                    .foregroundColor(Color(.efficioblue))
                    .padding(.bottom, 30)
                
                VStack(spacing: 20) {
                    ForEach(subjects.indices, id: \.self) { index in
                        TextField("Type here...", text: Binding(
                            get: {
                                subjects[index]
                            },
                            set: {
                                subjects[index] = $0
                            }
                        ))
                        .mitrFont(.subheadline, weight: .regular)
                        .foregroundColor(Color(.efficioblue))
                        .padding()
                        .frame(width: 270)
                        .background(
                            RoundedRectangle(cornerRadius: 25)
                                .stroke(Color(.efficioblue), lineWidth: 1)
                        )
                    }
                    .onDelete { indexSet in
                        subjects.remove(atOffsets: indexSet)
                    }
                    
                    if subjects.count < 5 {
                        Button(action: {
                            subjects.append("")
                        }) {
                            Text("+ Add another subject")
                                .mitrFont(.subheadline, weight: .regular)
                                .foregroundColor(Color(.efficioblue))
                        }
                    }
                }
                .padding(.bottom, 30)
                
                Spacer()
                
                VStack {
                    NavigationLink {
                        GoalSelectionView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Next")
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                    
                    NavigationLink {
                        SubjectSelectionView()
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
                .padding(.vertical, 50)
            }
            
            
            
        }
    }
    
    struct OtherSubject_Previews: PreviewProvider {
        static var previews: some View {
            OtherSubjectsView()
        }
    }
}
