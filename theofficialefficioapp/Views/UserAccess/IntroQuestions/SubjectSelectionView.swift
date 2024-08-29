//
//  SubjectSelectionView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 28/08/2024.
//

import SwiftUI

struct SubjectSelectionView: View {
    
    @State private var selectedSubjects: Set<String> = []

        let subjects = [
            "Maths", "English Language", "English Literature", "Biology", "Chemistry",
            "Physics", "Geography", "History", "Religious Studies", "Computer Science",
            "Economics", "Philosophy", "Further Maths", "French",
            "Spanish", "German", "Latin", "Other"
        ]
    
    var body: some View {
        VStack {
            Spacer()
            Text("Please select all the subjects that you are taking.")
                .font(.title2)
                .fontWeight(.bold)
                .lineLimit(nil)
                .multilineTextAlignment(.center)
                .foregroundColor(.efficioblue)
                .multilineTextAlignment(.center)
                .padding(.bottom, 20)
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
                            .font(.caption)
                            .fontWeight(.bold)
                            .foregroundColor(selectedSubjects.contains(subject) ? Color.white : Color.efficioblue)
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                            .padding(.vertical, 10)
                            .frame(maxWidth: 100)
                            .background(selectedSubjects.contains(subject) ? Color.efficioblue : Color.clear)
                            .cornerRadius(15) // Apply the corner radius here
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
        .font(.subheadline)
        .fontWeight(.semibold)
        .padding(.vertical, 50)

    }
}
    }


#Preview {
    SubjectSelectionView()
}
