

import SwiftUI

struct TimerView: View {
    let hours: Int
    let minutes: Int
    
    @State private var remainingTime: TimeInterval
    @State private var isRunning = false
    @State private var timer: Timer?
    @State private var showingCancelAlert = false
    @State private var showingFinishAlert = false
    @State private var showElapsedTime = false
    @State private var completed = false
    @EnvironmentObject var router: Router
    @StateObject var viewModel:ProductivityViewModel = ProductivityViewModel()
    init(hours: Int = 0, minutes: Int = 0) {
        self.hours = hours
        self.minutes = minutes
        _remainingTime = State(initialValue: TimeInterval((hours * 3600) + (minutes * 60)))
    }
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Spacer()
                
                Text(timeString(from: showElapsedTime ? (TimeInterval(hours * 3600 + minutes * 60) - remainingTime) : remainingTime))
                    .mitrFont(.title3, weight: .medium)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .cornerRadius(10)
                
                ToggleButton(showElapsedTime: $showElapsedTime)
                
                Spacer()
                
                HStack(spacing: 40) {
                    // Cancel Button
                    Button(action: {
                        showingCancelAlert = true
                    }) {
                        Image(systemName: "xmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    
                    

                    // Play/Pause Button
                    Button(action: toggleTimer) {
                        Image(systemName: isRunning ? "pause.circle.fill" : "play.circle.fill")
                            .resizable()
                            .frame(width: 50, height: 50)
                            .foregroundColor(.efficioblue)
                    }
                    
                    // Finish Button
                    Button(action: {
                        showingFinishAlert = true
                    }) {
                        Image(systemName: "checkmark")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.white)
                    }
                    
                }
                .padding(.bottom, 80)
            }
            .padding()
            .onAppear(perform: startTimerIfNeeded)
            .alert(isPresented: $completed) {
                Alert(
                    title: Text("Well Done!"),
                    message: Text("You completed the time!"),
                    dismissButton: .default(Text("OK")) {
                        resetTimer()
                    }
                )
            }
            .alert(isPresented: $showingFinishAlert) {
                Alert(
                    title: Text("Finish Timer"),
                    message: Text("Are you sure you want to end the timer early?"),
                    primaryButton: .destructive(Text("Finish")) {
                        completeTimer()
                    },
                    secondaryButton: .cancel()
                )
            }
            .alert(isPresented: $showingCancelAlert) {
                Alert(
                    title: Text("Cancel Timer"),
                    message: Text("Are you sure you want to cancel?"),
                    primaryButton: .destructive(Text("Yes")) {
                        resetTimer()
                    },
                    secondaryButton: .cancel(Text("No"))
                )
            }
        }.navigationBarBackButtonHidden()
    }
    
    // Function to start the timer if it's not already running
    func startTimerIfNeeded() {
        if !isRunning {
            startTimer()
        }
    }
    
    // Function to start the timer
    func startTimer() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            if remainingTime > 0 {
                remainingTime -= 1
            } else {
                completed = true
                pauseTimer()
            }
        }
    }
    
    // Function to pause the timer
    func pauseTimer() {
        isRunning = false
        timer?.invalidate()
    }
    
    // Function to toggle the timer
    func toggleTimer() {
        if isRunning {
            pauseTimer()
        } else {
            startTimer()
        }
    }
    
    // Function to reset the timer
    func resetTimer() {
        pauseTimer()
        remainingTime = TimeInterval((hours * 3600) + (minutes * 60))
        router.navigateBack()
    }
    
    // Function to complete the timer
    func completeTimer() {
        viewModel.addTask(focusTime: Int(TimeInterval((hours * 3600) + (minutes * 60))),sessionCount: 1)
        pauseTimer()
        router.navigateBack()
    }
    
    // Function to format the time into HH:mm:ss
    func timeString(from timeInterval: TimeInterval) -> String {
        let hours = Int(timeInterval) / 3600
        let minutes = (Int(timeInterval) % 3600) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

struct ToggleButton: View {
    @Binding var showElapsedTime: Bool
    
    var body: some View {
        Button(action: {
            showElapsedTime.toggle()
        }) {
            Text(showElapsedTime ? "Time Elapsed" : "Time Left")
                .mitrFont(.headline, weight: .medium)
                .foregroundColor(.white)
                .padding()
                .background(Color.efficioblue)
                .cornerRadius(10)
        }
    }
}
//struct TimerView_Previews: PreviewProvider {
//    static var previews: some View {
//        TimerView(hours: 1, minutes: 30) // Provide default values for hours and minutes
//    }
//}
