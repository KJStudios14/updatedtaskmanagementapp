

import SwiftUI

struct YearGroupSelectionView: View {
    
    
    @State private var selectedYear: Int = 7
    
    var body: some View {
        NavigationView{
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
            }
            
        }
        
        
    }
    
    
    struct YearGroupSelectionView_Previews: PreviewProvider {
        static var previews: some View {
            YearGroupSelectionView()
        }
    }
}
