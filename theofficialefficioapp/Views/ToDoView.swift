//
//  ToDoView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

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
        NavigationView{
            VStack{
                List(items) {item in
                    ToDoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                                
                            }
                            .tint(.efficioblue)
                        }
                }
                .listStyle(PlainListStyle())
                
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
            .sheet(isPresented: $viewModel.showingNewItemView){
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            }
        }
    }
}

#Preview {
    ToDoView(userId: "afcpUAtW8zT4eiJaQ2xHlR7gWWa2")
}
