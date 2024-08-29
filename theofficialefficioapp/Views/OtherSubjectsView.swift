//
//  OtherSubjectsView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 28/08/2024.
//

import SwiftUI

struct OtherSubjectsView: View {
    var body: some View {
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
        .font(.subheadline)
        .fontWeight(.semibold)
        .padding(.vertical, 50)

    }
}

#Preview {
    OtherSubjectsView()
}
