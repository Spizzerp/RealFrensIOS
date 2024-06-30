import SwiftUI

struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(
            // Dark gradient for a sleek, modern look
            // Adjust colors here to change the overall theme
            gradient: Gradient(colors: [
                Color(red: 0.1, green: 0.1, blue: 0.1),  // Dark gray
                Color(red: 0.3, green: 0.3, blue: 0.3)   // Medium gray
            ]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)  // Extend gradient to screen edges
    }
}
