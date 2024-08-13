//
//  ToDoListItemView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    
    
    let item: ToDoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading){
                Text(item.title)
                    .font(.headline)
                    .bold()
                    
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
            }
            
            Spacer()
            
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
            }
            
        }
    }
}

let newId = UUID().uuidString

#Preview {
    ToDoListItemView(item: .init(
        id: newId,
        title: "Become an academic weapon.",
        description: "Revise all of Year 12 content before September",
        dueDate: Date().timeIntervalSince1970,
        createdDate: Date().timeIntervalSince1970,
        isDone: false
    ))
}
