
import UIKit

extension UIFont {
    static func mitrFont(size: CGFloat, weight: UIFont.Weight) -> UIFont? {
        let fontName: String
        
        switch weight {
        case .regular:
            fontName = "Mitr-Regular" // Replace with your font name
        case .semibold:
            fontName = "Mitr-SemiBold" // Replace with your font name
        case .bold:
            fontName = "Mitr-Bold" // Replace with your font name
        default:
            fontName = "Mitr-Regular" // Default if weight is not recognized
        }
        
        return UIFont(name: fontName, size: size)
    }
}
