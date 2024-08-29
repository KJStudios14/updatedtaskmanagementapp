
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
                    .font(.system(size: 24))
                    .foregroundColor(.efficioblue)
            }
            
            VStack(alignment: .leading) {
                Text(item.title)
                    .mitrFont(.headline, weight: .regular)
                    
                HStack {
                    Image(systemName: "calendar")
                        .foregroundColor(item.dueDate < Date().timeIntervalSince1970 ? .red : .gray)
                    
                    Text(dueDateText(for: item.dueDate))
                        .mitrFont(.footnote, weight: .light)
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
                        .font(.system(size: 18))
                case .medium:
                    Image(systemName: "flag.fill")
                        .foregroundColor(.yellow)
                        .font(.system(size: 18))
                case .high:
                    Image(systemName: "flag.fill")
                        .foregroundColor(.red)
                        .font(.system(size: 18))
                }
            }
            .font(.footnote)
        }
        .onTapGesture(count: 2) {
                showingDetail = true
                }
                .sheet(isPresented: $showingDetail) {
                    ToDoItemDetailView(item: item)
                        .presentationDetents([.height(400)]) 
                        .presentationDragIndicator(.hidden)
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
        onItemTapped: { _ in }
    )
}
