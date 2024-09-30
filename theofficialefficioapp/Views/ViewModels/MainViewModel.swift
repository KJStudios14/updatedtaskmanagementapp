//
//  MainViewModel.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    @Published var currentUserId: String?
    @Published var user:FirebaseAuth.User?
    var handler : AuthStateDidChangeListenerHandle?
    
    var onValidated: ((Bool) -> Void)?
    
    init() {
        do{
            try Auth.auth().signOut()
        }catch{
            print(error)
        }
            self.handler = Auth.auth().addStateDidChangeListener{ [weak self] auth, user in
                if user != nil {
                    self!.user = user
                    self?.currentUserId = user?.uid
                    self!.onValidated?(true)
                }else{
                    self!.onValidated?(false)
                }
            }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
