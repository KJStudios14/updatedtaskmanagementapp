//
//  GettingStartedView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 10/08/2024.
//

import SwiftUI

struct SplashScreenView: View {
    @State private var isActive = false
    @State private var size = 0.8
    @State private var opacity = 0.5
    @EnvironmentObject var router: Router
    @StateObject var viewModel = MainViewModel()

    var body: some View {
        NavigationStack(){
                ZStack {
                    Color(.efficioblue)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                                                
                        VStack {
                            Image("logodark")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 300, height: 300)
                                .padding(.bottom, 140)
                        }
                        .scaleEffect(size)
                        .opacity(opacity)
                        .onAppear {
                            withAnimation(.easeIn(duration: 1.2)) {
                                self.size = 0.9
                                self.opacity = 1.0
                            }
                        }
                    }
                    .onAppear {
                        viewModel.onValidated = { isSuccess in
                            if isSuccess{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    withAnimation {
                                        router.navigate(to: .MainView)
                                    }
                                }
                            }else{
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                                    withAnimation {
                                        router.navigate(to: .Login)
                                    }
                                }
                            }
                        }
                        
                    }
                }
            
        }.navigationBarBackButtonHidden(true)
           
    }
}
            
            
struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        SplashScreenView()
    }
}


