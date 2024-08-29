
import SwiftUI

struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool

    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            
            VStack {
                Text("New Task")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top, 60)
                
                Form {
                    TextField("Title", text: $viewModel.title)
                    
                    
                    TextField("Description", text: $viewModel.description, axis: .vertical)
                    
                    DatePicker("Due Date", selection: $viewModel.dueDate, displayedComponents: .date)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.efficioblue)
                    
                    
                    Picker("Priority", selection: $viewModel.priority) {
                        Text("None").tag(ToDoListItem.Priority.none)
                        Text("Low").tag(ToDoListItem.Priority.low)
                        Text("Medium").tag(ToDoListItem.Priority.medium)
                        Text("High").tag(ToDoListItem.Priority.high)
                    }
                    .pickerStyle(MenuPickerStyle())
                
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            if viewModel.canSave {
                                viewModel.addTask()
                                newItemPresented = false
                            } else {
                                viewModel.showAlert = true
                            }
                        } label: {
                            Text("Add Task")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 225, height: 44)
                                .background(Color(.efficioblue))
                                .cornerRadius(15)
                        }
                        
                        Spacer()
                    }
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Error"), message: Text("Please fill in all fields and select a due date that is today or later."))
                    }

                }
            }
            
            .background(Color.white)
            
        }
        
    }
}
          
/*struct NewItemView: View {
    @StateObject var viewModel = NewItemViewModel()
    @Binding var newItemPresented: Bool
    
    var body: some View {
        ZStack {
            
            Color(.white)
                .ignoresSafeArea()
            
            VStack {
                Text("New Task")
                    .font(.system(size: 32))
                    .bold()
                    .padding(.top, 60)
                
                Form {
                    TextField("Title", text: $viewModel.title)
                    
                    TextField("Description", text: $viewModel.description, axis: .vertical)
                    
                    DatePicker("Due Date", selection: $viewModel.dueDate)
                        .datePickerStyle(GraphicalDatePickerStyle())
                        .accentColor(.efficioblue)
                    
                    
                    HStack {
                        Spacer()
                        
                        Button {
                            if viewModel.canSave {
                                viewModel.addtask()
                                newItemPresented = false
                            } else {
                                viewModel.showAlert = true
                            }
                        } label: {
                            Text("Add Task")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .frame(width: 225, height: 44)
                                .background(Color(.efficioblue))
                                .cornerRadius(15)
                        }
                        
                        Spacer()
                    }
                    .alert(isPresented: $viewModel.showAlert) {
                        Alert(title: Text("Error"), message: Text("Please fill in all fields and select a due date that is today or later."))
                    }
                }
                .background(Color.white)
                
            }
            
            
        }
    }
}

*/
#Preview {
    NewItemView(newItemPresented: Binding(
        get: {
            false
        },
        set: { _ in
            
        }
    ))
}
