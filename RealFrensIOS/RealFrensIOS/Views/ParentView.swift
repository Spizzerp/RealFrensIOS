import SwiftUI

/// ParentView manages the display of content, profile, album, event, and messaging views with a tab bar.
struct ParentView: View {
    /// The currently selected tab
    @State private var selectedTab: Tab = .content
    
    /// The color for the navigation bar title
    @State private var navBarTitleColor: Color = Color(hex: "9F85FF")

    var body: some View {
        NavigationView {
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
                    MessagingView()
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
            .navigationBarTitleDisplayMode(.inline)
        }
        .onAppear {
            setInitialNavBarAppearance()
        }
    }
    
    /// Enum representing the different tabs in the application
    enum Tab {
        case content, profile, messaging
        case album(Album)
        case event(Event)
    }

    /// Sets the initial appearance of the navigation bar
    private func setInitialNavBarAppearance() {
        let appearance = UINavigationBar.appearance()
        appearance.largeTitleTextAttributes = [.foregroundColor: UIColor(navBarTitleColor)]
        appearance.titleTextAttributes = [.foregroundColor: UIColor(navBarTitleColor)]
        appearance.backgroundColor = .clear
    }

    /// Changes the navigation bar title color
    /// - Parameter color: The new color for the navigation bar title
    func changeNavBarTitleColor(to color: Color) {
        navBarTitleColor = color
        setInitialNavBarAppearance()
    }
}

// MARK: - Preview Provider
struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
