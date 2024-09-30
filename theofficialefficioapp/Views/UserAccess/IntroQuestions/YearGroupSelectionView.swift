

import SwiftUI

struct YearGroupSelectionView: View {
    @State private var selectedYear: Int = 7
    @StateObject public var viewModel:SignUpViewModel

    @Binding var path: [String] 
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Spacer()
                
                Text("Please select your current year group.")
                    .mitrFont(.title2, weight: .medium)
                    .lineLimit(nil)
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color.efficioblue)
                    .padding(.bottom, 20)
                    .padding(.horizontal, 5)
                
                HStack(spacing: -1){
                    Text("Year")
                        .mitrFont(.headline, weight: .regular)
                        .foregroundColor(Color.efficioblue)
                    
                    Picker(selection: $selectedYear, label: Text("")) {
                        ForEach(7..<14) { year in
                            Text("\(year)")
                                .tag(year)
                                .mitrFont(.headline, weight: .regular)
                                .foregroundColor(Color.efficioblue)
                        }
                    }
                    .onSubmit {
                        viewModel.selectedYear = selectedYear
                    }
                    .pickerStyle(WheelPickerStyle())
                    .frame(width: 100, height: 45)
                    .cornerRadius(15)
                    .padding(.horizontal, 1)
                    
                }
                .frame(maxWidth: .infinity, alignment: .center)
                .padding(.bottom, 50)

                
                Spacer()
                
                VStack {
                    Button {
                        path.append("SubjectSelection")
                        
                    } label: {
                        Text("Next")
                            .foregroundColor(.white)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                    
                    
                    Button {
                        path.removeLast()
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
                .padding(.vertical, 50)
            }.navigationDestination(for: String.self) { value in
                if value == "SubjectSelection" {
                    SubjectSelectionView(path:$path, viewModel: viewModel)
                }
            }
        }.navigationBarBackButtonHidden()
    }
}


//#Preview {
//    YearGroupSelectionView(viewModel: SignUpViewModel())
//}
