//
//  ToDoListItem.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import Foundation

struct ToDoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
