//
//  User.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import Foundation

struct User: Codable {
    
    let id: String
    let fullname: String
    let username: String
    let email: String
    let joined: TimeInterval
    let preferedname:String
    let selectedhour:Int
    let selectedminute:Int
    let selectedyear:Int
    let selectedgoals:[String]
    let selectedsubjects:[String]

    
    func asDictionary() -> [String: Any] {
           return [
               "id": id,
               "fullname": fullname,
               "username": username,
               "email": email,
               "joined": joined,
               "preferedname": joined,
               "selectedhour": selectedhour,
               "selectedminute": selectedminute,
               "selectedyear": selectedyear,
               "selectedgoals": selectedgoals,
               "selectedsubjects": selectedsubjects
           ]
       }
    





}


