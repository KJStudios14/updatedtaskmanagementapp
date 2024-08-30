//
//  ToDoItemDetailView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 28/08/2024.
//

import SwiftUI

struct ToDoItemDetailView: View {
    let item: ToDoListItem

        var body: some View {
            ZStack {
                VStack(spacing: 20) {
                    Text(item.title)
                        .mitrFont(.title, weight: .semibold)  
                    
                    Text(item.description)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    HStack {
                        Text("Due Date: ")
                            .fontWeight(.semibold)
                        Text("\(dueDateText(for: item.dueDate))")
                    }
                    
                    HStack {
                        Text("Priority: ")
                            .fontWeight(.semibold)
                        switch item.priority {
                        case .none:
                            Text("None")
                            Image(systemName: "flag.slash")
                                .foregroundColor(.gray)
                        case .low:
                            Text("Low")
                                .foregroundColor(.green)
                            Image(systemName: "flag.fill")
                                .foregroundColor(.green)
                        case .medium:
                            Text("Medium")
                                .foregroundColor(.yellow)
                            Image(systemName: "flag.fill")
                                .foregroundColor(.yellow)
                        case .high:
                            Text("High")
                                .foregroundColor(.red)
                            Image(systemName: "flag.fill")
                                .foregroundColor(.red)
                        }
                    }
                    
                    Spacer()
                }
                .padding(.top, 50)
                .foregroundColor(.white)
                .background(Color.efficioblue)
                .cornerRadius(15)
            }
            .ignoresSafeArea(.all)
            
        }
        
        func dueDateText(for dueDate: TimeInterval) -> String {
            let dueDate = Date(timeIntervalSince1970: dueDate)
            let calendar = Calendar.current
            
            if calendar.isDateInToday(dueDate) {
                return "Today"
            } else if calendar.isDateInTomorrow(dueDate) {
                return "Tomorrow"
            } else {
                return dueDate.formatted(date: .abbreviated, time: .omitted)
            }
        }
    }

    #Preview {
        ToDoItemDetailView(item: .init(
            id: "1",
            title: "Example Task",
            description: "This is a detailed description of the example task.",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false,
            priority: .medium
        ))
    }
