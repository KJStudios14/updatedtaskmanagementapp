
import SwiftUI

struct ToDoListItemView: View {
    @StateObject var viewModel = ToDoListItemViewModel()
    let item: ToDoListItem
    let onItemTapped: (ToDoListItem) -> Void
    @State private var showingDetail = false
    @State private var isFading = false
    @State private var shouldRemove = false

    var body: some View {
        HStack {
            Button {
                if !item.isDone {
                    viewModel.toggleIsDone(item: item)
                    withAnimation {
                        isFading = true
                    }
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                        // Allow strikethrough effect to be visible for 0.5 seconds before removing
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            // Remove the item from the view model
                            shouldRemove = true
                        }
                    }
                }
            } label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .font(.system(size: 24))
                    .foregroundColor(.efficioblue)
            }
            .buttonStyle(PlainButtonStyle())
            
            Button(action: {
                showingDetail = true
            }) {
                HStack {
                    VStack(alignment: .leading) {
                        Text(item.title)
                            .mitrFont(.headline, weight: .regular)
                            .strikethrough(item.isDone, color: .gray) // Strike-through effect
                            .opacity(isFading ? 0 : 1) // Fade out effect
                            .animation(.easeInOut(duration: 2), value: isFading) // Animation for fade-out

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
                            Image(systemName: "flag.slash")
                                .foregroundColor(.black)
                                .font(.system(size: 18))
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
            }
            .buttonStyle(PlainButtonStyle())
        }
        .opacity(isFading ? 0 : 1) // Ensure the entire row fades out
        .animation(.easeInOut(duration: 2), value: isFading) // Animation for fade-out
        .onChange(of: shouldRemove) { _ in
            if shouldRemove {
                viewModel.removeItem(item)
            }
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
