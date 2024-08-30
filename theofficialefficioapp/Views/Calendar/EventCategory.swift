//
//  EventCategory.swift
//  theofficialefficioapp
//
//  Created by KJemide on 29/08/2024.
//

import SwiftUI

enum Category: String {
    case general = "General"
    case exam = "Exam"
    case meeting = "Meeting"
    case lecture = "Lecture"
    case extracurricular = "Extracurricular"
    
    var color: Color{
        switch self {
        case .general:
            return Color("efficioblue")
        case .exam:
            return Color("blue1")
        case .meeting:
            return Color("blue2")
        case .lecture:
            return Color("blue3")
        case .extracurricular:
            return Color("blue4")
        }
    }
}



