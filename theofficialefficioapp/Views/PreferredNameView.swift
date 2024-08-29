//
//  PreferredNameView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 28/08/2024.
//

import SwiftUI

struct PreferredNameView: View {
    @State private var preferredName: String = ""
    
    var body: some View {
        
        Spacer()
                    
        Text("Please enter your preferred name.")
            .font(.title2)
            .fontWeight(.bold)
            .foregroundColor(.efficioblue)
            .padding(.bottom, 5)
        
        Text("What would you like to be called?")
            .font(.subheadline)
            .fontWeight(.semibold)
            .foregroundColor(.efficioblue)
            .padding(.bottom, 50)
        
        ZStack(alignment: .bottomTrailing) {
            
            VStack(spacing: 0.01){
                TextField("Type here...", text: $preferredName, onEditingChanged: { _ in
                    if preferredName.count > 10 {
                        preferredName = String(preferredName.prefix(10))
                    }
                })
                .font(.headline)
                .padding(.vertical, 2)
                .foregroundColor(Color.efficioblue)
                .onChange(of: preferredName) { newValue in
                    if newValue.count > 10 {
                        preferredName = String(newValue.prefix(10))
                    }}
                
                Divider()
                    .frame(height: 2)
                    .background(Color.efficioblue)
                
                Text("\(preferredName.count)/10")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(Color.efficioblue)
                    .padding(.top, 5)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                
                
            }
            
            
            
        }
        .padding(.horizontal, 40)
        .padding(.bottom, 40)
        
        
        Spacer()
       
        VStack {
            NavigationLink {
                YearGroupSelectionView()
                    .navigationBarBackButtonHidden(true)
            } label: {
                    Text("Next")
                }
                .foregroundColor(.white)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
                .frame(width: 225, height: 44)
                .background(Color.efficioblue)
            .cornerRadius(15)
        }
        .padding(.vertical, 50)
    }

}


#Preview {
    PreferredNameView()
}
