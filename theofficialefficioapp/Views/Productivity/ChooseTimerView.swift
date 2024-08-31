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
            VStack(spacing: 10) {
                
                Spacer()
                
                Text("Choose Timer")
                    .mitrFont(.largeTitle, weight: .medium)
                    .padding(.top, 30)
                
                HStack(spacing: 10) {
                    Picker("Hours", selection: $selectedHours) {
                        ForEach(0..<3) { hour in
                            Text("\(hour) hours")
                                .mitrFont(.headline, weight: .medium)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 150)

                    Picker("Minutes", selection: $selectedMinutes) {
                        ForEach([0, 15, 30, 45], id: \.self) { minute in
                            Text("\(minute) minutes")
                                .mitrFont(.headline, weight: .medium)
                        }
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 150)
                }
                .padding(.vertical, -35)
                
        
                NavigationLink(destination: TimerView(hours: selectedHours, minutes: selectedMinutes)
                                .navigationBarBackButtonHidden(true)) {
                    Text("Start Timer")
                        .mitrFont(.headline, weight: .medium)
                        .foregroundColor(.white)
                        .padding()
                        .frame(width: 225, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(10)
                }
                .padding(.top, 50)
                
                Spacer()
            }
            .padding()
            .padding(.bottom, 100)
            
        }
        .mitrFont()
    }
}

#Preview {
    ChooseTimerView()
}
