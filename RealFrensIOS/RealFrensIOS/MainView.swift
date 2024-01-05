import SwiftUI

struct MainView: View {
    @State private var currentTab: Tab = .content

    var body: some View {
        ZStack {
            // Switch between different content views
            switch currentTab {
            case .content:
                ContentView()
            case .profile:
                ProfileView()
            }
            
            // Overlay the TabBarView at the bottom of the screen
            VStack {
                Spacer()
                TabBarView(
                    onProfileSelected: {
                        print("Profile Selected")
                        currentTab = .profile
                    },
                    onContentSelected: {
                        print("Map Selected")
                        currentTab = .content
                    }
                )
                .padding()
                .background(Color.clear) // Set the background to clear
            }
        }
    }

    enum Tab {
        case content, profile
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
