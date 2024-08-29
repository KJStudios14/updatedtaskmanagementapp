//
//  ChooseTimerView.swift
//  theofficialefficioapp
//
//  Created by KJemide on 29/08/2024.
//

import SwiftUI

struct ChooseTimerView: View {
    @State private var selectedHours = 0
    @State private var selectedMinutes = 0
    @State private var navigateToTimerView = false

    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Picker for Hours and Minutes
                HStack(spacing: 20) {
                    Picker("Hours", selection: $selectedHours) {
                        ForEach(0..<3) { hour in
                            Text("\(hour) hours")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 150)

                    Picker("Minutes", selection: $selectedMinutes) {
                        ForEach([0, 15, 30, 45], id: \.self) { minute in
                            Text("\(minute) minutes")
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 150)
                }
                
                // Navigation Link to TimerView
                NavigationLink(destination: TimerView(hours: selectedHours, minutes: selectedMinutes)
                                .navigationBarBackButtonHidden(true)) {
                    Text("Start Timer")
                        .font(.headline)
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.efficioblue)
                        .cornerRadius(10)
                }
                .padding(.top, 50)
            }
            .padding()
            .navigationTitle("Choose Time")
        }
    }
}

#Preview {
    ChooseTimerView()
}
