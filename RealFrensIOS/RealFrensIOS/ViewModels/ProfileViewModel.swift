import Combine
import SwiftUI

class ProfileViewModel: ObservableObject {
    @Published var user: User?
    @Published var albums: [Album] = []
    @Published var badges: [BadgeInfo] = []
    @Published var showingPopup = false
    @Published var selectedBadgeInfo: BadgeInfo?
    
    // Properties for user stats
    @Published var frensCount: Int = 120
    @Published var pinsCount: Int = 20
    @Published var level: Int = 420

    private var cancellables = Set<AnyCancellable>()

    init() {
        loadMockData()
    }

    // MARK: - Load Mock Data
    private func loadMockData() {
        self.user = User(id: "1", username: "@BrokeBoiCapital", profileImageURL: "pfp3", fullname: "John Doe", bio: "Hello world, welcome to my first app", email: "john@example.com")
        self.albums = [
            Album(id: 1, title: "Japan 2023", coverImage: "mock1", images: ["mock1", "mock2", "mock3"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey."),
            Album(id: 2, title: "France 2024", coverImage: "mock2", images: ["mock2", "mock3", "mock4"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey."),
            Album(id: 3, title: "Thailand 2022", coverImage: "mock3", images: ["mock3", "mock1", "mock2"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey."),
            Album(id: 4, title: "New York 2023", coverImage: "mock4", images: ["mock4", "mock3", "mock2"], date: Date(), description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey.")
        ]
        self.badges = [
            BadgeInfo(title: "Badge: Mountaineer", description: "Participated in Mountain DAO's Denver retreat.", dateAcquired: "01/01/2021", imageName: "badge1"),
            BadgeInfo(title: "Badge: Solana After Dark", description: "Posted a picture at BreakPoint's afterparty.", dateAcquired: "02/02/2021", imageName: "badge2"),
            BadgeInfo(title: "Badge: Giga Gamer", description: "Attended the Solana games conference.", dateAcquired: "03/03/2021", imageName: "badge3"),
            BadgeInfo(title: "Badge: Backpacker", description: "Connected to RealFrens with a Backpack wallet.", dateAcquired: "04/04/2021", imageName: "badge4")
        ]
        
        // Mock data for stats
        self.frensCount = 120
        self.pinsCount = 20
        self.level = 420
    }

    // MARK: - Select Badge
    func selectBadge(badge: BadgeInfo) {
        selectedBadgeInfo = badge
        showingPopup = true
    }

    // MARK: - Dismiss Popup
    func dismissPopup() {
        showingPopup = false
    }
}
