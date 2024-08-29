

import SwiftUI

struct GlobalFontModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .mitrFont(.body)
            .onAppear {
                UILabel.appearance().font = UIFont(name: "Mitr", size: UIFont.labelFontSize)
                UINavigationBar.appearance().largeTitleTextAttributes = [.font : UIFont(name: "Mitr", size: 34)!]
                UINavigationBar.appearance().titleTextAttributes = [.font : UIFont(name: "Mitr", size: 20)!]
            }
    }
}
