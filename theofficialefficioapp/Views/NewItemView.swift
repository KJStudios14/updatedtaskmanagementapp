//
//  NewItemView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 11/08/2024.
//

import SwiftUI


struct NewItemView: View {
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


#Preview {
    NewItemView(newItemPresented: Binding(
        get: {
            false
        },
        set: { _ in
            
        }
    ))
}
