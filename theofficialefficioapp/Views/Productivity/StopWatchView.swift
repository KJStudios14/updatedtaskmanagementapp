

import SwiftUI

struct StopWatchView: View {
    @State private var isRunning = false
    @State private var timeElapsed: TimeInterval = 0
    @State private var timer: Timer?
    @State private var showingCancelAlert = false
    @State private var showingFinishAlert = false
    @StateObject var viewModel:ProductivityViewModel = ProductivityViewModel()
    @EnvironmentObject var router: Router
    var body: some View {
            ZStack {
                Color.black
                    .ignoresSafeArea()
                
                VStack(spacing: 20) {
                    
                    Spacer()
                    
                    Text(timeString(from: timeElapsed))
                        .mitrFont(.title3, weight: .medium)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity)
                        .cornerRadius(10)

                    Spacer()
                    
                    HStack(spacing: 50) {
                        // Cancel Button
                        Button(action: {
                            showingCancelAlert = true
                        }) {
                            Image(systemName: "xmark")
                                .resizable()
                                .frame(width: 20, height: 20)
                                .foregroundColor(.white)
                        }
                        .alert(isPresented: $showingCancelAlert) {
                            Alert(
                                title: Text("Cancel Stopwatch"),
                                message: Text("Are you sure you want to cancel?"),
                                primaryButton: .destructive(Text("Yes")) {
                                    resetStopwatch()
                                },
                                secondaryButton: .cancel(Text("No"))
                            )
                        }
                        
                        // Play/Pause Button
                        Button(action: toggleStopwatch) {
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
                        .alert(isPresented: $showingFinishAlert) {
                            Alert(
                                title: Text("Finish Stopwatch"),
                                message: Text("Are you sure you want to finish?"),
                                primaryButton: .destructive(Text("Finish")) {
                                    finishStopwatch()
                                },
                                secondaryButton: .cancel()
                            )
                        }
                    }
                    .padding(.bottom, 80)
                }
                .padding()
            }.navigationBarBackButtonHidden()
        
    }
    
    // Function to toggle the stopwatch
    func toggleStopwatch() {
        if isRunning {
            pauseStopwatch()
        } else {
            startStopwatch()
        }
    }
    
    // Function to start the stopwatch
    func startStopwatch() {
        isRunning = true
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { _ in
            timeElapsed += 1
        }
    }
    
    // Function to pause the stopwatch
    func pauseStopwatch() {
        isRunning = false
        timer?.invalidate()
    }
    
    // Function to reset the stopwatch
    func resetStopwatch() {
        pauseStopwatch()
        timeElapsed = 0
        router.navigateBack()
    }

    // Function to finish the stopwatch session
    func finishStopwatch() {
        viewModel.addTask(focusTime: Int(timeElapsed),sessionCount: 1)
        pauseStopwatch()
        router.navigateBack()
        // Additional actions to finalize the session, if needed
    }
    
    // Function to format the time elapsed into HH:mm:ss
    func timeString(from timeInterval: TimeInterval) -> String {
        let hours = Int(timeInterval) / 3600
        let minutes = (Int(timeInterval) % 3600) / 60
        let seconds = Int(timeInterval) % 60
        return String(format: "%02d:%02d:%02d", hours, minutes, seconds)
    }
}

