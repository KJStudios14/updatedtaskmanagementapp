//
//  User.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import Foundation

struct User: Codable {
    
    var id: String
    var fullname: String
    var username: String
    var email: String
    var joined: TimeInterval
    var preferedname:String
    var selectedhour:Int
    var selectedminute:Int
    var selectedyear:Int
    var selectedgoals:[String]
    var selectedsubjects:[String]

    
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


