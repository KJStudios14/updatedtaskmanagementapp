

import SwiftUI

struct GoalSelectionView: View {
    @State private var selectedGoals: [String] = []
    @State private var showAlert: Bool = false
    @State public var dataModel:SignUpModel
    @EnvironmentObject var router: Router
    let goals = [
        "Improve my grades in core subjects",
        "Complete all homework on time",
        "Prepare effectively for exams",
        "Improve in challenging subjects",
        "Develop better study habits and routines"
    ]
    
    var body: some View {
            VStack {
                Spacer()
                
                Text("Please select your goals for the academic year.")
                    .mitrFont(.title2, weight: .medium)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(.efficioblue))
                    .padding(.top, 45)
                    .padding(.bottom, 5)
                
                Text("Select all that apply.")
                    .mitrFont(.subheadline, weight: .regular)
                    .foregroundColor(Color(.efficioblue))
                    .padding(.bottom, 20)
                
                VStack(spacing: 20) {
                    ForEach(goals, id: \.self) { goal in
                        Button(action: {
                            toggleSelection(for: goal)
                        }) {
                            Text(goal)
                                .mitrFont(.body, weight: .regular)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .foregroundColor(selectedGoals.contains(goal) ? .white : Color(.efficioblue))
                                .background(selectedGoals.contains(goal) ? Color(.efficioblue) : Color.white)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(.efficioblue), lineWidth: 2)
                                )
                                .cornerRadius(10)
                        }
                    }
                }
                .padding(.horizontal, 30)
                
                Spacer()
                
                VStack(spacing: 5) { // Added spacing here to restore padding
                    Button(action: {
                        if selectedGoals.isEmpty {
                            showAlert = true
                        } else {
                            dataModel.selectedGoals = selectedGoals
                            router.navigate(to: .SummaryView(dataModel: dataModel))
                        }
                    }) {
                        Text("Next")
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text("Please select at least one goal."), dismissButton: .default(Text("OK")))
                    }
                    
                    Button {
                        router.navigateBack()
                    } label: {
                        Text("Back")
                            .foregroundColor(.efficioblue)
                            .frame(width: 225, height: 44)
                            .background(Color.white)
                            .cornerRadius(15)
                            .overlay(
                                RoundedRectangle(cornerRadius: 15)
                                    .stroke(Color.efficioblue, lineWidth: 2)
                            )
                    }
                }
                .mitrFont(.subheadline, weight: .regular)
                .fontWeight(.semibold)
                .padding(.vertical, 50) // Ensure there's vertical padding here
            }
        
        
    }
    
    private func toggleSelection(for goal: String) {
        if let index = selectedGoals.firstIndex(of: goal) {
            selectedGoals.remove(at: index)
        } else {
            selectedGoals.append(goal)
        }
    }
}

//#Preview {
//    GoalSelectionView(viewModel: SignUpViewModel())
//}
