//
//  GettingStartedView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 10/08/2024.
//

import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color(.efficioblue)
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Image("logodark")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                    .padding(.bottom, 140)
                
                Spacer()
            }
        }
    }
}
    #Preview {
        SplashScreenView()
    }

