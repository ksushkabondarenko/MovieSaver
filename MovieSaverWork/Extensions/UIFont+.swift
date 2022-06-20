import UIKit

enum FontWeight: String {
    case bold = "Manrope-Bold"
    case extraBold = "Manrope-ExtraBold"
    case light = "Manrope-Light"
    case extraLight = "Manrope-ExtraLight"
    case medium = "Manrope-Medium"
    case regular = "Manrope-Regular"
    case semiBold = "Manrope-SemiBold"
    
}


extension UIFont {
    static func manrope(ofSize size: CGFloat, weight: FontWeight) -> UIFont {
        return UIFont(name: weight.rawValue, size: size)!
    }
}
