import SwiftUI

// MARK: - Color Extension
/// Extension to initialize Color from a hex string or integer.
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: Double(r) / 0xff,
            green: Double(g) / 0xff,
            blue: Double(b) / 0xff
        )
    }

    init(hex: Int, alpha: Double = 1.0) {
        let r = Double((hex & 0xff0000) >> 16) / 255.0
        let g = Double((hex & 0x00ff00) >> 8) / 255.0
        let b = Double(hex & 0x0000ff) / 255.0

        self.init(
            .sRGB,
            red: r,
            green: g,
            blue: b,
            opacity: alpha
        )
    }
}
