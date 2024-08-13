//
//  User.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import Foundation

struct User {
    let id: String
    let fullname: String
    let username: String
    let email: String
    let joined: TimeInterval
    
    
//CHATGPT CODE
    func asDictionary() -> [String: Any] {
           return [
               "id": id,
               "fullname": fullname,
               "username": username,
               "email": email,
               "joined": joined
           ]
       }
    

}


