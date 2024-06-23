import SwiftUI

/// A custom background view with gradients.
struct BackgroundView: View {
    var body: some View {
        ZStack {
            // Background gradient
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.18, green: 0.18, blue: 0.18), Color(red: 0.09, green: 0.09, blue: 0.09)]),
                startPoint: .top, endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)
        }
    }
}
