import SwiftUI

// MARK: - Data Models
struct BadgeInfo {
    let title: String
    let description: String
    let dateAcquired: String
}

struct Album: Identifiable {
    let id: Int
    let title: String
    let coverImage: String
    let images: [String]
}

// MARK: - Profile View
struct ProfileView: View {
    // MARK: - Properties
    // Mock data for images and badges
    let mockImages = ["mock1", "mock2", "mock3", "mock4"]
    let mockBadges = ["badge1", "badge2", "badge3", "badge4"]
    
    // Sample data for badge popups
    let badgeDetails = [
        "badge1": BadgeInfo(title: "Badge: Mountaineer", description: "Participated in Mountain DAO's Denver retreat.", dateAcquired: "01/01/2021"),
        "badge2": BadgeInfo(title: "Badge: Solana After Dark", description: "Posted a picture at BreakPoint's afterparty.", dateAcquired: "02/02/2021"),
        "badge3": BadgeInfo(title: "Badge: Giga Gamer", description: "Attended the Solana games conference.", dateAcquired: "03/03/2021"),
        "badge4": BadgeInfo(title: "Badge: Backpacker", description: "Connected to RealFrens with a Backpack wallet.", dateAcquired: "04/04/2021")
    ]
    
    // Sample data for albums
    let albums = [
        Album(id: 1, title: "Japan 2023", coverImage: "mock1", images: ["mock1", "mock2", "mock3"]),
        Album(id: 2, title: "France 2024", coverImage: "mock2", images: ["mock2", "mock3", "mock4"]),
        Album(id: 3, title: "Thailand 2022", coverImage: "mock3", images: ["mock3", "mock1", "mock2"]),
        Album(id: 4, title: "New York 2023", coverImage: "mock4", images: ["mock4", "mock3", "mock2"]),
        // Add more sample albums
    ]
    
    // State variables for popup
    @State private var showingPopup = false
    @State private var selectedBadgeInfo = BadgeInfo(title: "", description: "", dateAcquired: "")
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                backgroundView
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        profileImageSection
                        statIndicatorSection
                        usernameDescriptionSection
                        customDivider
                        badgeRow
                        customDivider
                        imageRow
                    }
                    .padding(.top, UIScreen.main.bounds.height * 0.02)
                }
                
                hamburgerMenuButton
                
                if showingPopup {
                    popupView
                }
            }
        }
    }
    
    // MARK: - Background View
    var backgroundView: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.clear]), startPoint: .bottom, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            LinearGradient(gradient: Gradient(colors: [Color.white, Color.clear]), startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
        }
    }
    
    // MARK: - Profile Image Section
    var profileImageSection: some View {
        Image("pfp3")
            .resizable()
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white.opacity(1), lineWidth: 3))
            .padding(.top, 0)
    }
    
    // MARK: - Stat Indicator Section
    var statIndicatorSection: some View {
        HStack(spacing: 35) {
            StatView(count: "120", label: "Frens", countColor: Color(hex: "9F85FF"))
            StatView(count: "20", label: "Pins", countColor: Color(hex: "9F85FF"))
            StatView(count: "420", label: "Level", countColor: Color(hex: "9F85FF"))
        }
        .padding(.vertical, 25)
    }
    
    // MARK: - Username and Description Section
    var usernameDescriptionSection: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text("@BrokeBoiCapital")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 159/255, green: 133/255, blue: 255/255))
                
                Button(action: {
                    // Add the action you want to perform when the button is tapped
                }) {
                    HStack {
                        Image("Tipicon") // Assuming the icon is added as "tip_icon" in your assets
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)
                        
                        Text("TIP")
                            .font(.body)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color(hex: "9F85FF"))
                    .cornerRadius(6)
                }
            }
            
            Text("Hello world, welcome to my first app")
                .font(.body)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
    
    // MARK: - Custom Divider
    var customDivider: some View {
        Image("Divider")
            .resizable()
            .scaledToFit()
            .frame(height: 15)
            .padding(.horizontal)
            .padding(.vertical, 1)
    }
    
    // MARK: - Badge Row
    var badgeRow: some View {
        HStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(mockBadges, id: \.self) { badgeName in
                        Image(badgeName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .shadow(radius: 3)
                            .onTapGesture {
                                selectedBadgeInfo = badgeDetails[badgeName] ?? BadgeInfo(title: "Unknown", description: "No description", dateAcquired: "N/A")
                                showingPopup = true
                            }
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .padding(.bottom, 0)
    }
    
    // MARK: - Album Cover Row
    var imageRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(albums) { album in
                    NavigationLink(destination: AlbumView(album: album)) {
                        ZStack(alignment: .bottomLeading) {
                            Image(album.coverImage)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 250, height: 150)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                .shadow(radius: 5)
                                .padding(.vertical, 22)
                            
                            VStack {
                                Spacer()
                                    .frame(maxHeight: 10)
                                
                                HStack {
                                    AlbumInfoView(icon: "photo", count: album.images.count)
                                    Spacer()
                                    AlbumInfoView(icon: "heart", count: 100) // Replace with actual like count
                                    Spacer()
                                    AlbumInfoView(icon: "bubble.left", count: 20) // Replace with actual comment count
                                }
                                .padding(.horizontal, 20)
                                .padding(.bottom, 10)
                            }
                            .background(
                                RoundedCorners(color: Color(hex: "181818"), tl: 0, tr: 0, bl: 10, br: 10)
                            )
                        }
                    }
                }
            }
            .padding(.horizontal)
        }
    }
    
    // MARK: - Hamburger Menu Button
    var hamburgerMenuButton: some View {
        VStack {
            HStack {
                Spacer()
                Menu {
                    Button(action: {}) {
                        Label("Settings", systemImage: "gear")
                    }
                    Button(action: {}) {
                        Label("QR Code", systemImage: "qrcode.viewfinder")
                    }
                    Button(action: {}) {
                        Label("Insights", systemImage: "chart.bar")
                    }
                    Button(action: {}) {
                        Label("Wallet", systemImage: "creditcard")
                    }
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            Spacer()
        }
    }
    
    // MARK: - Badge Popup View
    var popupView: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                Text(selectedBadgeInfo.title)
                    .font(.headline)
                    .padding()
                
                Text(selectedBadgeInfo.description)
                    .font(.body)
                
                Text("Acquired: \(selectedBadgeInfo.dateAcquired)")
                    .font(.footnote)
                    .padding(.bottom)
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            
            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        showingPopup = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(20)
                    }
                }
                Spacer()
            }
            .frame(width: 300, height: 200)
        }
    }
}

// MARK: - Stat View Component
struct StatView: View {
    let count: String
    let label: String
    let countColor: Color
    
    var body: some View {
        VStack {
            Text(count)
                .font(.headline)
                .fontWeight(.bold)
                .foregroundColor(countColor)
            Text(label)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white) // Change the label color to white
        }
    }
}

// MARK: - Album Info View Component
struct AlbumInfoView: View {
    let icon: String
    let count: Int
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(hex: "9F85FF"))
            Text("\(count)")
                .font(.body)
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "9F85FF"))
        }
    }
}

// MARK: - Rounded Corners Shape
struct RoundedCorners: View {
    let color: Color
    let tl: CGFloat
    let tr: CGFloat
    let bl: CGFloat
    let br: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height
                
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w/2, y: 0))
                path.addLine(to: CGPoint(x: w-tr, y: 0))
                path.addArc(center: CGPoint(x: w-tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h-br))
                path.addArc(center: CGPoint(x: w-br, y: h-br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h-bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}

// MARK: - Preview Provider
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
