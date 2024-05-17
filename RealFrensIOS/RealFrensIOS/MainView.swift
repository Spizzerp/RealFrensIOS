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
                Spacer() // This will push the tab bar to the bottom
                
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
                .padding(.bottom, 20) // Remove the bottom padding
                .background(Color.clear)
            }
            .edgesIgnoringSafeArea(.bottom) // Extend the VStack to the bottom edge of the screen
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
