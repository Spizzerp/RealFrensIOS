import SwiftUI

struct CustomFontModifier: ViewModifier {
    var size: CGFloat
    var weight: Font.Weight = .regular

    func body(content: Content) -> some View {
        content
            .font(.custom("Switzer Variable", size: size))
            .fontWeight(weight)
    }
}

extension View {
    func customFont(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        self.modifier(CustomFontModifier(size: size, weight: weight))
    }
}

