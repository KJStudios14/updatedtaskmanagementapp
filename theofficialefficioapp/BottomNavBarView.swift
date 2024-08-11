//
//  BottomNavBarView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct BottomNavBarView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        TabView(selection: $selectedTab){
            HomeView()
                .tabItem {
                    Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                }
                .onAppear{ selectedTab = 0}
                .tag(0)
            
            ToDoView()
                .tabItem {
                    Image(systemName: "list.bullet")
                }
                .onAppear{ selectedTab = 1}
                .tag(1)
            
            CalendarView()
                .tabItem {
                    Image(systemName: "calendar")
                }
                .onAppear{ selectedTab = 2}
                .tag(2)
            
            ProductivityView()
                .tabItem {
                    Image(systemName: selectedTab == 3 ? "chart.pie.fill" : "chart.pie")
                        .environment(\.symbolVariants, selectedTab == 3 ? .fill : .none)
                }
                .onAppear{ selectedTab = 3}
                .tag(3)
        }
        .tint(.efficioblue)
    }
}

#Preview {
    BottomNavBarView()
}
