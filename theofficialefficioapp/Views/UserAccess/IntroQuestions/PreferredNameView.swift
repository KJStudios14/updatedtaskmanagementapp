

import SwiftUI

struct PreferredNameView: View {
    @State private var preferredName: String = ""
    @State private var showAlert: Bool = false
    @State private var navigateToNextView: Bool = false

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                
                Text("Please enter your preferred name.")
                    .mitrFont(.title2, weight: .medium)
                    .foregroundColor(.efficioblue)
                    .padding(.bottom, 3)
                
                Text("What would you like to be called?")
                    .mitrFont(.subheadline, weight: .regular)
                    .foregroundColor(.efficioblue)
                    .padding(.bottom, 50)
                
                ZStack(alignment: .bottomTrailing) {
                    VStack(spacing: 0.01) {
                        TextField("Type here...", text: $preferredName, onEditingChanged: { _ in
                            if preferredName.count > 10 {
                                preferredName = String(preferredName.prefix(10))
                            }
                        })
                        .mitrFont(.headline, weight: .regular)
                        .padding(.vertical, 2)
                        .foregroundColor(Color.efficioblue)
                        
                        Divider()
                            .frame(height: 2)
                            .background(Color.efficioblue)
                        
                        Text("\(preferredName.count)/10")
                            .mitrFont(.footnote, weight: .regular)
                            .foregroundColor(Color.efficioblue)
                            .padding(.top, 5)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
                .padding(.horizontal, 40)
                .padding(.bottom, 40)
                
                Spacer()
                
                VStack {
                    Button(action: {
                        if preferredName.isEmpty {
                            showAlert = true
                        } else {
                            navigateToNextView = true
                        }
                    }) {
                        Text("Next")
                            .foregroundColor(.white)
                            .mitrFont(.subheadline, weight: .regular)
                            .frame(width: 225, height: 44)
                            .background(Color.efficioblue)
                            .cornerRadius(15)
                    }
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Error"), message: Text("Please fill in this field."), dismissButton: .default(Text("OK")))
                    }
                    
                    NavigationLink(
                        destination: YearGroupSelectionView()
                            .navigationBarBackButtonHidden(true),
                        isActive: $navigateToNextView
                    ) {
                        EmptyView()
                    }
                }
                .padding(.vertical, 50)
            }
        }
        .navigationViewStyle(StackNavigationViewStyle()) 
    }
}

#Preview {
    PreferredNameView()
}
