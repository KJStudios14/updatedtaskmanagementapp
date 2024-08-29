

import SwiftUI

// Enum for different weights of the Mitr font
enum MitrWeight {
    case light
    case bold
    case medium
    case regular
    case semibold

    
    var weight: Font.Weight {
        switch self {
        case .light:
            return .light
        case .bold:
            return .bold
        case .medium:
            return .medium
        case .regular:
            return .regular
        case .semibold:
            return .semibold
        }
    }
}


