import SwiftUI

// MARK: - Parent View
/// ParentView manages the display of content and profile views with a tab bar.
struct ParentView: View {
    @State private var selectedTab: Tab = .content

    // MARK: - Body
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
            }
            
            // Tab bar for navigation
            VStack {
                Spacer()
                TabBarView(
                    onProfileSelected: {
                        selectedTab = .profile
                    },
                    onContentSelected: {
                        selectedTab = .content
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
struct ParentView_Previews: PreviewProvider {
    static var previews: some View {
        ParentView()
    }
}
