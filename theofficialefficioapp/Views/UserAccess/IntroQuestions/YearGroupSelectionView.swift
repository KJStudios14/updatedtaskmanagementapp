

import SwiftUI

struct YearGroupSelectionView: View {
    @State private var selectedYear: Int = 7
    
    var body: some View {
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
                    .mitrFont(.title3, weight: .regular)
                    .foregroundColor(Color.efficioblue)
                
                Picker(selection: $selectedYear, label: Text("")) {
                    ForEach(7..<14) { year in
                        Text("\(year)")
                            .tag(year)
                            .mitrFont(.title3, weight: .regular)
                            .foregroundColor(Color.efficioblue)
                    }
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
                NavigationLink {
                    SubjectSelectionView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    Text("Next")
                        .foregroundColor(.white)
                        .frame(width: 225, height: 44)
                        .background(Color.efficioblue)
                        .cornerRadius(15)
                }
            
                
                NavigationLink {
                    PreferredNameView()
                        .navigationBarBackButtonHidden(true)
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
        }
    }
}


#Preview {
    YearGroupSelectionView()
}
