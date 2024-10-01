//
//  TaskData.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 01/10/24.
//

import Foundation

struct TaskData: Identifiable {
    let id = UUID()  // Unique identifier for each data point
    let day: String  // Day of the week
    let completed: Int  // Number of completed tasks
    let remaining: Int  // Number of remaining tasks
}
let weeklyTaskData = [
    TaskData(day: "Mon", completed: 5, remaining: 3),
    TaskData(day: "Tue", completed: 6, remaining: 2),
    TaskData(day: "Wed", completed: 3, remaining: 4),
    TaskData(day: "Thu", completed: 7, remaining: 1),
    TaskData(day: "Fri", completed: 4, remaining: 3),
    TaskData(day: "Sat", completed: 2, remaining: 5),
    TaskData(day: "Sun", completed: 6, remaining: 0)
]
