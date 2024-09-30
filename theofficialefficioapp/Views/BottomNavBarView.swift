//
//  BottomNavBarView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct BottomNavBarView: View {
    @State private var selectedTab = 0
    @StateObject var viewModel = MainViewModel()
    var body: some View {
        NavigationStack{
            TabView(selection: $selectedTab){
                HomeView()
                    .tabItem {
                        Image(systemName: selectedTab == 0 ? "house.fill" : "house")
                            .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    }
                    .onAppear{ selectedTab = 0}
                    .tag(0)
                
                ToDoView(userId: viewModel.user!.uid)
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
                
                NotesView()
                    .tabItem {
                        Image(systemName: "square.and.pencil")
                    }
                    .onAppear{ selectedTab = 3}
                    .tag(3)
                
                
                ProductivityView()
                    .tabItem {
                        Image(systemName: selectedTab == 4 ? "chart.pie.fill" : "chart.pie")
                            .environment(\.symbolVariants, selectedTab == 4 ? .fill : .none)
                    }
                    .onAppear{ selectedTab = 4}
                    .tag(4)
                
                
            }.background(Color.black)
                .tint(.efficioblue)
        }
    }
}

//#Preview {
//    BottomNavBarView()
//}
