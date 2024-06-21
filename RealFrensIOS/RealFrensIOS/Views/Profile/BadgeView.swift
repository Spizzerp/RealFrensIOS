import SwiftUI

/// Displays a single badge with tap functionality.
struct BadgeView: View {
    let badge: BadgeInfo
    let onTap: () -> Void
    
    var body: some View {
        Image(badge.imageName)
            .resizable()
            .scaledToFit()
            .frame(width: 50, height: 50)
            .shadow(radius: 3)
            .onTapGesture {
                onTap()
            }
    }
}
