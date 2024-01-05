import SwiftUI

struct ParentView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        VStack {
            // Your content
            if selectedTab == 0 {
                ContentView()
            } else if selectedTab == 1 {
                ProfileView()
            }

            TabBarView(
                onProfileSelected: { selectedTab = 1 },
                onContentSelected: { selectedTab = 0 }
            )
        }
    }
}
