//
//  MainView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewModel()
    
    @Binding var path: [String] 
    var body: some View {
        NavigationStack(path: $path){
            VStack{
                
            }
            .navigationDestination(for: String.self) { value in
                if value == "BottomNavBarView" {
                    BottomNavBarView()
                }else if value == "LogInView"{
                    LogInView(path: $path)
                }
            }
        }.background(Color.gray)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            path.removeLast()
            viewModel.onValidated = { isSuccess in
                if isSuccess {
                    path.append("BottomNavBarView")
                }else{
                    path.append("LogInView")
                }
            }
        })
        
    }
}

//#Preview {
//    MainView(path: $NavigationPath())
//}
