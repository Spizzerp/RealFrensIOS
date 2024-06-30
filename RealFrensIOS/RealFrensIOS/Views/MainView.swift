import SwiftUI

/// MainView manages the different tabs of the application, including content, profile, album, event, and messaging views.
struct MainView: View {
    /// The currently selected tab
    @State private var currentTab: Tab = .content
    
    /// The color for the navigation bar title
    @State private var navBarTitleColor: Color = Color(hex: "9F85FF")

    var body: some View {
        NavigationView {
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
                    MessagingView()
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
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarColor(backgroundColor: .clear, titleColor: navBarTitleColor.uiColor)
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
        appearance.largeTitleTextAttributes = [.foregroundColor: navBarTitleColor.uiColor]
        appearance.titleTextAttributes = [.foregroundColor: navBarTitleColor.uiColor]
    }
    
    /// Changes the navigation bar title color
    /// - Parameter color: The new color for the navigation bar title
    func changeNavBarTitleColor(to color: Color) {
        navBarTitleColor = color
        setInitialNavBarAppearance()
    }
}

// MARK: - Navigation Bar Modifiers
extension View {
    func navigationBarColor(backgroundColor: UIColor?, titleColor: UIColor?) -> some View {
        self.modifier(NavigationBarModifier(backgroundColor: backgroundColor, titleColor: titleColor))
    }
}

struct NavigationBarModifier: ViewModifier {
    var backgroundColor: UIColor?
    var titleColor: UIColor?
    
    init(backgroundColor: UIColor?, titleColor: UIColor?) {
        self.backgroundColor = backgroundColor
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithTransparentBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: titleColor ?? .white]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: titleColor ?? .white]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
    }
    
    func body(content: Content) -> some View {
        ZStack{
            content
            VStack {
                GeometryReader { geometry in
                    Color(self.backgroundColor ?? .clear)
                        .frame(height: geometry.safeAreaInsets.top)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                }
            }
        }
    }
}

// MARK: - Color Extension for UIColor Conversion
extension Color {
    var uiColor: UIColor {
        UIColor(self)
    }
}

// MARK: - Preview Provider
struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
