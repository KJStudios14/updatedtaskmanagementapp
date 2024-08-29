import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import SwiftUI

struct ToDoView: View {
    @StateObject var viewModel: ToDoViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
        
            VStack {
                Picker("Sort By", selection: $viewModel.sortBy) {
                    Text("Sort by Due Date").tag(ToDoViewModel.SortCriterion.dueDate)
                    Text("Sort by Priority").tag(ToDoViewModel.SortCriterion.priority)
                }
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .padding(.vertical, 2)
                
                if viewModel.sortedItems(items).isEmpty {
                    VStack(spacing: 20) {
                        Text("All tasks completed!")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding(.top, 40)
                        
                        Image("celebration")
                            .resizable()
                            .frame(width: 300, height: 300)
                    }
                    .frame(maxHeight: .infinity, alignment: .top)
                    
                } else {
                    List(viewModel.sortedItems(items)) { item in
                        ToDoListItemView(item: item, onItemTapped: { selectedItem in
                                                    viewModel.selectedItem = selectedItem // Set the selected item
                                                })
                            .swipeActions {
                                Button("Delete") {
                                    viewModel.itemToDelete = item
                                    viewModel.showDeleteConfirmation = true
                                }
                                .tint(.efficioblue) 
                            }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("My Tasks")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.efficioblue)
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            .alert(isPresented: $viewModel.showDeleteConfirmation) {
                Alert(
                    title: Text("Confirm Deletion"),
                    message: Text("Are you sure you want to delete this task?"),
                    primaryButton: .destructive(Text("Delete")) {
                        viewModel.delete()
                    },
                    secondaryButton: .cancel()
                )
            }
            .sheet(item: $viewModel.selectedItem) { item in
                            ToDoItemDetailView(item: item) // Show the pop-up
                        }
                    }
                }
        }


/*struct ToDoView: View {
    @StateObject var viewModel: ToDoViewModel
    @FirestoreQuery var items: [ToDoListItem]
    
    @State private var itemToDelete: ToDoListItem?
    @State private var showingDeleteAlert = false

    init(userId: String) {
        self._items = FirestoreQuery(
            collectionPath: "users/\(userId)/todos"
        )
        self._viewModel = StateObject(
            wrappedValue: ToDoViewModel(userId: userId)
        )
    }
    
    var body: some View {
        NavigationView {
            VStack {
                if items.isEmpty {
                    Text("You have no tasks.")
                        .font(.headline)
                        .foregroundColor(.gray)
                        .padding(.top, 180) 
                        .frame(maxHeight: .infinity, alignment: .top)
                } else {
                    List(items) { item in
                        ToDoListItemView(item: item)
                            .swipeActions {
                                Button("Delete") {
                                    itemToDelete = item
                                    showingDeleteAlert = true
                                }
                                .tint(.efficioblue) // Adjust tint as needed
                            }
                    }
                    .listStyle(PlainListStyle())
                }
            }
            .navigationTitle("To Do List")
            .toolbar {
                Button {
                    viewModel.showingNewItemView = true
                } label: {
                    Image(systemName: "plus")
                        .foregroundColor(.efficioblue)
                }
            }
            .sheet(isPresented: $viewModel.showingNewItemView) {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
            .alert(isPresented: $showingDeleteAlert) {
                Alert(
                    title: Text("Are you sure?"),
                    message: Text("Are you sure you want to delete this task?"),
                    primaryButton: .destructive(Text("Delete")) {
                        if let itemToDelete = itemToDelete {
                            viewModel.delete(id: itemToDelete.id)
                        }
                    },
                    secondaryButton: .cancel()
                )
            }
        }
    }
}
*/

#Preview {
    ToDoView(userId: "afcpUAtW8zT4eiJaQ2xHlR7gWWa2")
}

