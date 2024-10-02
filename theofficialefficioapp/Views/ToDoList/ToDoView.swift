

import FirebaseFirestore
import FirebaseFirestoreCombineSwift
import SwiftUI

struct ToDoView: View {
    @StateObject var viewModel: ToDoViewModel
    @FirestoreQuery var items: [ToDoListItem]
    @EnvironmentObject var router: Router
    
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
                HStack {
                    Text("My Tasks")
                        .mitrFont(.title, weight: .semibold)
                        .foregroundColor(.white)
                    Spacer()
                    Button {
                        viewModel.showingNewItemView = true
                    } label: {
                        Image(systemName: "plus")
                            .resizable()
                            .frame(width: 23, height: 23)
                            .foregroundColor(.white)
                    }
                }
                .padding()
                .background(Color.efficioblue)
                
                Picker("Sort By", selection: $viewModel.sortBy) {
                    Text("Sort by Due Date")
                        .tag(ToDoViewModel.SortCriterion.dueDate)
                    Text("Sort by Priority")
                        .tag(ToDoViewModel.SortCriterion.priority)
                }
                .mitrFont(.headline, weight: .regular)
                .pickerStyle(SegmentedPickerStyle())
                .padding(.horizontal)
                .padding(.vertical, 2)
                
                if viewModel.sortedItems(items).isEmpty {
                    VStack(spacing: 20) {
                        Text("All tasks completed!")
                            .mitrFont(.title2, weight: .regular)
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
                            viewModel.selectedItem = selectedItem
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
                ToDoItemDetailView(item: item)
            }
            .mitrFont()
        }
    }
}

//#Preview {
//    ToDoView(userId: "afcpUAtW8zT4eiJaQ2xHlR7gWWa2")
//}
