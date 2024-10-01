//
//  MainViewModel.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import FirebaseAuth
import Foundation

class MainViewModel: ObservableObject {
    
    var handler : AuthStateDidChangeListenerHandle?
    
    var onValidated: ((Bool) -> Void)?
    
    init() {

            self.handler = Auth.auth().addStateDidChangeListener{ [weak self] auth, user in
                if user != nil {
    
                    self?.onValidated?(true)
                }else{
                    self?.onValidated?(false)
                }
            }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
