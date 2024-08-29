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
    let onItemTapped: (ToDoListItem) -> Void
    @State private var showingDetail = false

    var body: some View {
        HStack {
            Button {
                viewModel.toggleIsDone(item: item)
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.efficioblue)
            }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.headline)
                    .bold()
                    
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(item.dueDate < Date().timeIntervalSince1970 ? .red : .gray)
                    
                    Text(dueDateText(for: item.dueDate))
                        .font(.footnote)
                        .foregroundColor(item.dueDate < Date().timeIntervalSince1970 ? .red : Color(.secondaryLabel))
                }
                
                
            }
            
            Spacer()
            
            HStack {
                switch item.priority {
                case .none:
                    EmptyView()
                case .low:
                    Image(systemName: "flag.fill")
                        .foregroundColor(.green)
                        .frame(width: 5, height: 5)
                case .medium:
                    Image(systemName: "flag.fill")
                        .foregroundColor(.yellow)
                case .high:
                    Image(systemName: "flag.fill")
                        .foregroundColor(.red)
                }
            }
            .font(.footnote)
            
            
        }
        .onTapGesture(count: 2) {
                showingDetail = true
                }
                .sheet(isPresented: $showingDetail) {
                    ToDoItemDetailView(item: item)
                        .presentationDetents([.height(400)]) // Adjust height as needed
                        .presentationDragIndicator(.hidden) // Hide the drag indicator
                }
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
    

/*struct ToDoListItemView: View {
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

 
*/

let newId = UUID().uuidString

#Preview {
    ToDoListItemView(
        item: .init(
            id: "1",
            title: "Become an academic weapon.",
            description: "Revise all of Year 12 content before September",
            dueDate: Date().timeIntervalSince1970,
            createdDate: Date().timeIntervalSince1970,
            isDone: false,
            priority: .high
        ),
        onItemTapped: { _ in } // Provide a dummy closure for the preview
    )
}



