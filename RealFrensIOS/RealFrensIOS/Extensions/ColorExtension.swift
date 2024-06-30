import SwiftUI

// MARK: - Color Extension
/// Extension to initialize Color from various hex string formats or integer.
extension Color {
    /// Initializes a Color from a hex string (6 characters).
    /// - Parameter hex: A string representing the color in hexadecimal format (RRGGBB).
    ///   The '#' prefix is optional.
    init(hex: String) {
        let scanner = Scanner(string: hex.replacingOccurrences(of: "#", with: ""))
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

    /// Initializes a Color from an integer value and an optional alpha.
    /// - Parameters:
    ///   - hex: An integer representing the color in hexadecimal format.
    ///   - alpha: The opacity of the color, ranging from 0 (transparent) to 1 (opaque).
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

    /// Initializes a Color from a hex string, supporting various formats.
    /// - Parameter hex: A string representing a color in hexadecimal format.
    ///   Supported formats are: RGB (3 characters), RRGGBB (6 characters), AARRGGBB (8 characters).
    ///   The '#' prefix is optional.
    init(hexCode hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        var r: CGFloat = 0.0
        var g: CGFloat = 0.0
        var b: CGFloat = 0.0
        var a: CGFloat = 1.0

        let length = hexSanitized.count

        guard Scanner(string: hexSanitized).scanHexInt64(&rgb) else {
            self.init(.black)
            return
        }

        switch length {
        case 3: // RGB (12-bit)
            r = CGFloat((rgb >> 8) & 0xF) / 15.0
            g = CGFloat((rgb >> 4) & 0xF) / 15.0
            b = CGFloat(rgb & 0xF) / 15.0
        case 6: // RGB (24-bit)
            r = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
            g = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
            b = CGFloat(rgb & 0x0000FF) / 255.0
        case 8: // ARGB (32-bit)
            r = CGFloat((rgb & 0xFF000000) >> 24) / 255.0
            g = CGFloat((rgb & 0x00FF0000) >> 16) / 255.0
            b = CGFloat((rgb & 0x0000FF00) >> 8) / 255.0
            a = CGFloat(rgb & 0x000000FF) / 255.0
        default:
            self.init(.black)
            return
        }

        self.init(red: r, green: g, blue: b, opacity: a)
    }
}
