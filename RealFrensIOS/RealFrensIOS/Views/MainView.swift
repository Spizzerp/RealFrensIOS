import SwiftUI

/// MainView manages the different tabs of the application, including content, profile, album, event, and messaging views.
struct MainView: View {
    /// The currently selected tab
    @State private var currentTab: Tab = .content

    var body: some View {
        ZStack {
            // Content based on current tab
            switch currentTab {
            case .content:
                ContentView()
            case .profile:
                ProfileView {
                    currentTab = .content
                }
            case .album(let album):
                AlbumView(album: album) {
                    currentTab = .content
                }
            case .event(let event):
                EventView(event: event) {
                    currentTab = .content
                }
            case .messaging:
                MessagingView() // You'll need to create this view
            }

            // Tab bar for navigation
            VStack {
                Spacer()
                TabBarView(
                    onProfileSelected: { currentTab = .profile },
                    onContentSelected: { currentTab = .content },
                    onNotificationsSelected: { /* Handle notifications */ },
                    onMessagingSelected: { currentTab = .messaging }
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
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
