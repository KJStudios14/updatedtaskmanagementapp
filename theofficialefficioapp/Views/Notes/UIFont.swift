
import UIKit

extension UIFont {
    static func mitrFont(size: CGFloat, weight: UIFont.Weight) -> UIFont? {
        let fontName: String
        
        switch weight {
        case .regular:
            fontName = "Mitr-Regular" 
        case .semibold:
            fontName = "Mitr-SemiBold"
        case .bold:
            fontName = "Mitr-Bold"
        default:
            fontName = "Mitr-Regular"
        }
        
        return UIFont(name: fontName, size: size)
    }
}


