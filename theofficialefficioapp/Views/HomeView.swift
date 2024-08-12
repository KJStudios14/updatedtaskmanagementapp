//
//  HomeView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct HomeView: View {
    @StateObject var viewModel = HomeViewModel()
    
    
    var body: some View {
        NavigationView{
            VStack{
                
            }
            .navigationTitle("Profile")
        }
    }
}

#Preview {
    HomeView()
}
