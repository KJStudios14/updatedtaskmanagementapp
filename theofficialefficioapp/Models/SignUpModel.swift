//
//  SignUpModel.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 30/09/24.
//

import Foundation

public struct SignUpModel: Codable, Hashable {
    
     var fullname = ""
     var preferedName = ""
     var selectedYear:Int = 7
     var username = ""
     var email = ""
     var password = ""
     var selectedSubjects: Set<String> = []
     var selectedGoals: [String] = []
     var selectedHour = 1
     var selectedMinute = 0
}
