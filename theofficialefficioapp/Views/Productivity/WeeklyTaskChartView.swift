//
//  WeeklyTaskChartView.swift
//  theofficialefficioapp
//
//  Created by Monang Champaneri on 01/10/24.
//

import SwiftUI
import Charts

struct WeeklyTaskChartView: View {
    let taskData: [TaskData] = weeklyTaskData
    
    var body: some View {
        Chart(taskData) { data in
            // Bar for completed tasks
            BarMark(
                x: .value("Day", data.day),
                y: .value("Completed", data.completed)
            )
            .foregroundStyle(.blue)  // Color for completed tasks
            .annotation(position: .top) {
                Text("\(data.completed)")
                    .font(.caption)
            }
            
            // Bar for remaining tasks
            BarMark(
                x: .value("Day", data.day),
                y: .value("Remaining", data.remaining)
            )
            .foregroundStyle(.orange)  // Color for remaining tasks
            .annotation(position: .top) {
                Text("\(data.remaining)")
                    .font(.caption)
            }
        }
        .frame(height: 300)
        .padding()
        .chartXAxis {
            AxisMarks(values: .automatic) { _ in
                AxisGridLine()
                AxisTick()
                AxisValueLabel()
            }
        }
        .chartYAxis {
            AxisMarks(position: .leading)
        }
    }
}
