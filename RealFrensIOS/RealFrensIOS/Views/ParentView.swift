import SwiftUI

/// ParentView manages the display of content, profile, album, event, and messaging views with a tab bar.
struct ParentView: View {
    /// The currently selected tab
    @State private var selectedTab: Tab = .content

    var body: some View {
        ZStack {
            // Content based on selected tab
            switch selectedTab {
            case .content:
                ContentView()
            case .profile:
                ProfileView {
                    selectedTab = .content
                }
            case .album(let album):
                AlbumView(album: album) {
                    selectedTab = .content
                }
            case .event(let event):
                EventView(event: event) {
                    selectedTab = .content
                }
            case .messaging:
                MessagingView() // You'll need to create this view
            }
            
            // Tab bar for navigation
            VStack {
                Spacer()
                TabBarView(
                    onProfileSelected: { selectedTab = .profile },
                    onContentSelected: { selectedTab = .content },
                    onNotificationsSelected: { /* Handle notifications */ },
                    onMessagingSelected: { selectedTab = .messaging }
                )
                .padding(.bottom, 20)
                .background(Color.clear)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    /// Enum representing the different tabs in the application
    enum Tab {
        case content, profile, messaging
        case album(Album)
        case event(Event)
    }
}

// MARK: - Preview Provider
struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
