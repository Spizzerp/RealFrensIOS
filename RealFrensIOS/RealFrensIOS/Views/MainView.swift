import SwiftUI

// MARK: - Main View
/// MainView manages the different tabs of the application, including content, profile, album, and event views.
struct MainView: View {
    @State private var currentTab: Tab = .content

    // MARK: - Body
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
            }

            // Tab bar for navigation
            VStack {
                Spacer()
                TabBarView(
                    onProfileSelected: {
                        currentTab = .profile
                    },
                    onContentSelected: {
                        currentTab = .content
                    }
                )
                .padding(.bottom, 20)
                .background(Color.clear)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }

    // MARK: - Tab Enum
    enum Tab {
        case content, profile
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
