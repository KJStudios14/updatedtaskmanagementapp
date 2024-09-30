

import SwiftUI

struct PreferredNameView: View {
    @State private var preferredName: String = ""
    @State private var showAlert: Bool = false
    @StateObject public var viewModel:SignUpViewModel
    @Binding var path: [String] 
    var body: some View {
        NavigationStack(path: $path) {
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
                            viewModel.preferedName = preferredName
                            path.append("YearGroupView")
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
                }
                .padding(.vertical, 50)
            }.navigationDestination(for: String.self) { value in
                if value == "YearGroupView" {
                    YearGroupSelectionView(viewModel: viewModel,path:$path)
                }
            }
        }.navigationBarBackButtonHidden()
    }
}
//
//#Preview {
//    PreferredNameView(viewModel: SignUpViewModel())
//}
