import SwiftUI

struct MainView: View {
    @State private var currentTab: Tab = .content
    
    var body: some View {
        ZStack {
            switch currentTab {
            case .content:
                ContentView()
            case .profile:
                ProfileView()
            case .album(let album):
                AlbumView(album: album)
            case .event(let event):
                EventView(event: event)
            }
            
            VStack {
                Spacer()
                TabBarView(
                    onProfileSelected: {
                        print("Profile Selected")
                        currentTab = .profile
                    },
                    onContentSelected: {
                        print("Content Selected")
                        currentTab = .content
                    }
                )
                .padding(.bottom, 20)
                .background(Color.clear)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
    
    enum Tab {
        case content, profile
        case album(Album)
        case event(Event)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
