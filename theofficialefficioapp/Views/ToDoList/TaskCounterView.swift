//
//  TaskCounterView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 31/08/2024.
//

import SwiftUI

struct TaskCounterView: View {
    @StateObject private var viewModel = TaskCounterViewModel()
    
    var body: some View {
        VStack {
            Text("Tasks Completed Today")
                .font(.title)
                .padding(.bottom, 20)
            
            Text("\(viewModel.completedTasks)")
                .font(.largeTitle)
                .fontWeight(.bold)
                .padding()
        }
        .onAppear {
            viewModel.fetchCompletedTasks()
        }
    }
}

#Preview {
    TaskCounterView()
}
