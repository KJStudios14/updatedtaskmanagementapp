//
//  Untitled.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 02/10/24.
//
import Foundation

public struct ProductivityModel: Codable, Hashable {
    
    var date :String = ""
    var focusTime:Int = 0
    var completedTasks:Int = 0
    var remaingTasks:Int = 0
    var sessionCount:Int = 0
    
}
