import SwiftUI

// MARK: - Parent View
/// ParentView manages the display of content and profile views with a tab bar.
struct ParentView: View {
    @State private var selectedTab: Int = 0

    // MARK: - Body
    var body: some View {
        VStack {
            // Content based on selected tab
            if selectedTab == 0 {
                ContentView()
            } else if selectedTab == 1 {
                ProfileView()
            }

            // Tab bar for navigation
            TabBarView(
                onProfileSelected: { selectedTab = 1 },
                onContentSelected: { selectedTab = 0 }
            )
        }
    }
}
