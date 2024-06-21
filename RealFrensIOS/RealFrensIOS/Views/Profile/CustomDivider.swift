import SwiftUI

/// A custom divider used to separate sections.
struct CustomDivider: View {
    var body: some View {
        Image("Divider")
            .resizable()
            .scaledToFit()
            .frame(height: 15)
            .padding(.horizontal)
            .padding(.vertical, 1)
    }
}
