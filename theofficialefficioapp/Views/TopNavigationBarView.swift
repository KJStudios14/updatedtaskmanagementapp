//
//  TopNavigationBarView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 29/08/2024.
//

import SwiftUI

struct TopNavigationBarView: View {
    var body: some View {
        HStack {
            Spacer()

            NavigationLink(destination: SettingsView()) {
                Image(systemName: "gearshape.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 24, height: 24)
                    .foregroundColor(.efficioblue)
                    .padding(.trailing, -8)
            }
        }
        .padding(.horizontal)
        .frame(height: 55)
        .background(Color.white.opacity(0.1))
    }
}

#Preview {
    TopNavigationBarView()
}
