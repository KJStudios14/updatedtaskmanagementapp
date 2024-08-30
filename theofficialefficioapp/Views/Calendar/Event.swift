//
//  Event.swift
//  theofficialefficioapp
//
//  Created by KJemide on 29/08/2024.
//

import SwiftUI

struct Event: Identifiable {
    var id: UUID = .init()
    var dateAdded: Date
    var eventName: String
    var eventDescription: String
    var eventCategory: Category
}

// Sample tasks (events)
var sampleEvents: [Event] = [
    .init(
        dateAdded: Date(), // Today
        eventName: "Maths Homework",
        eventDescription: "Complete algebra exercises from the textbook.",
        eventCategory: .lecture
    ),
    .init(
        dateAdded: Date().addingTimeInterval(86400), // Tomorrow
        eventName: "Team Meeting",
        eventDescription: "Discuss the project milestones and assign tasks.",
        eventCategory: .extracurricular
    ),
    .init(
        dateAdded: Date(), // Today
        eventName: "Doctor's Appointment",
        eventDescription: "Routine check-up with Dr. Smith at the health center.",
        eventCategory: .meeting
    ),
    .init(
        dateAdded: Date().addingTimeInterval(86400), // Tomorrow
        eventName: "Grocery Shopping",
        eventDescription: "Buy vegetables, fruits, and other weekly groceries.",
        eventCategory: .meeting
    ),
    .init(
        dateAdded: Date(), // Today
        eventName: "Yoga Session",
        eventDescription: "Attend the evening yoga session at the community center.",
        eventCategory: .general
    )
]
