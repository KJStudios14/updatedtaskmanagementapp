

import SwiftUI

extension Font {
    static func mitrFont(for textStyle: Font.TextStyle) -> Font {
        let size: CGFloat
        switch textStyle {
        case .largeTitle:
            size = 34
        case .title:
            size = 28
        case .title2:
            size = 22
        case .title3:
            size = 20
        case .headline:
            size = 17
        case .subheadline:
            size = 15
        case .body:
            size = 14
        case .callout:
            size = 16
        case .footnote:
            size = 13
        case .caption:
            size = 12
        case .caption2:
            size = 11
        @unknown default:
            size = 14
        }
        return .custom("Mitr", size: size)
    }
}

struct MitrFontModifier: ViewModifier {
    var textStyle: Font.TextStyle
    var weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(Font.mitrFont(for: textStyle))
            .fontWeight(weight)
    }
}

extension View {
    func mitrFont(_ textStyle: Font.TextStyle = .body, weight: Font.Weight = .regular) -> some View {
        self.modifier(MitrFontModifier(textStyle: textStyle, weight: weight))
    }
}
