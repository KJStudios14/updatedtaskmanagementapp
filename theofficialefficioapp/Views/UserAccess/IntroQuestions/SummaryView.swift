//
//  SummaryView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 28/08/2024.
//

import SwiftUI

struct SummaryView: View {
    var body: some View {
        Spacer()
        
        VStack {
            NavigationLink {
                HomeView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                Text("Next")
                    .foregroundColor(.white)
                    .frame(width: 225, height: 44)
                    .background(Color.efficioblue)
                    .cornerRadius(15)
            }
            
            NavigationLink {
               DailyHoursView()
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

#Preview {
    SummaryView()
}
