import SwiftUI

/// Displays a horizontal scrollable list of user badges.
struct BadgeSection: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 15) {
                ForEach(viewModel.badges) { badge in
                    BadgeView(badge: badge) {
                        viewModel.selectBadge(badge: badge)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
