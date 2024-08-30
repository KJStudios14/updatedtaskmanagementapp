//
//  SearchBarView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 30/08/2024.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var text: String
    var placeholder: String
    
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            TextField(placeholder, text: $text)
                .foregroundColor(.gray)
                .mitrFont(.subheadline, weight: .regular)
        }
        .padding(10)
        .background(Color.white)
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color.gray, lineWidth: 1) 
        )
        .padding([.leading, .trailing], 15)
        .padding(.top, 12)
        .padding(.bottom, 5)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarView(text: .constant("Sample Search Text"), placeholder: "Search notes...")
    }
}
