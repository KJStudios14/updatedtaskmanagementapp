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
                    LogInView()
                }
            }
        }.background(Color.gray)
        .navigationBarBackButtonHidden(true)
        .onAppear(perform: {
            viewModel.onValidated = { isSuccess in
                if isSuccess {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            path.append("BottomNavBarView")
                        }}
                }else{
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        withAnimation {
                            path.append("LogInView")
                        }}
                }
            }
        })
        
    }
}

//#Preview {
//    MainView(path: $NavigationPath())
//}
