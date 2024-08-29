//
//  ProductivityView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct ProductivityView: View {
    var body: some View {
        NavigationView{
            
            HStack{
                NavigationLink {
                    ChooseTimerView()
                } label: {
                    Text("Timer")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 150, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(15)
                }
                NavigationLink {
                    StopWatchView()
                } label: {
                    Text("Stopwatch")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .frame(width: 150, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(15)
                }
            }
            
            
            }
            .navigationTitle("My Productivity")
        }
    }


#Preview {
    ProductivityView()
}
