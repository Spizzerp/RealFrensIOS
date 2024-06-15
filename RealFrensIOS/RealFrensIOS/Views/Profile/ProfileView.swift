import SwiftUI

// MARK: - Profile View
/// ProfileView displays the user's profile information, including stats, badges, and albums.
struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    // MARK: - Body
    var body: some View {
        NavigationView {
            ZStack {
                CustomGradientBackground()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ProfileImageView(imageURL: viewModel.user?.profileImageURL)
                        statIndicatorSection
                        usernameDescriptionSection
                        customDivider
                        badgeRow
                        customDivider
                        albumRow
                    }
                    .padding(.top, UIScreen.main.bounds.height * 0.02)
                }
                
                hamburgerMenuButton
                
                if viewModel.showingPopup {
                    badgePopupView
                }
            }
        }
    }
    
    // MARK: - Stat Indicator Section
    private var statIndicatorSection: some View {
        HStack(spacing: 35) {
            StatView(count: "\(viewModel.frensCount)", label: "Frens", countColor: Color(hex: "9F85FF"))
            StatView(count: "\(viewModel.pinsCount)", label: "Pins", countColor: Color(hex: "9F85FF"))
            StatView(count: "\(viewModel.level)", label: "Level", countColor: Color(hex: "9F85FF"))
        }
        .padding(.vertical, 25)
    }
    
    // MARK: - Username and Description Section
    private var usernameDescriptionSection: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text(viewModel.user?.username ?? "")
                    .customFont(size: 20, weight: .bold)
                    .foregroundColor(Color(red: 159/255, green: 133/255, blue: 255/255))
                
                Button(action: {
                    // Add the action you want to perform when the button is tapped
                }) {
                    HStack {
                        Image("Tipicon")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 16, height: 16)
                            .foregroundColor(.white)
                        
                        Text("TIP")
                            .customFont(size: 16, weight: .semibold)
                            .foregroundColor(.white)
                    }
                    .padding(.vertical, 5)
                    .padding(.horizontal, 10)
                    .background(Color(hex: "9F85FF"))
                    .cornerRadius(6)
                }
            }
            
            Text(viewModel.user?.bio ?? "")
                .customFont(size: 16)
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
    
    // MARK: - Custom Divider
    private var customDivider: some View {
        Image("Divider")
            .resizable()
            .scaledToFit()
            .frame(height: 15)
            .padding(.horizontal)
            .padding(.vertical, 1)
    }
    
    // MARK: - Badge Row
    private var badgeRow: some View {
        HStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.badges) { badge in
                        BadgeView(badge: badge) {
                            viewModel.selectBadge(badge: badge)
                        }
                    }
                }
                .padding(.horizontal)
            }
            Spacer()
        }
        .padding(.bottom, 0)
    }
    
    // MARK: - Album Row
    private var albumRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(viewModel.albums) { album in
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
                                    AlbumInfoView(icon: "heart", count: 100)
                                    Spacer()
                                    AlbumInfoView(icon: "bubble.left", count: 20)
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
    private var hamburgerMenuButton: some View {
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
    private var badgePopupView: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                Text(viewModel.selectedBadgeInfo?.title ?? "")
                    .customFont(size: 18, weight: .bold)
                    .padding()
                
                Text(viewModel.selectedBadgeInfo?.description ?? "")
                    .customFont(size: 16)
                
                Text("Acquired: \(viewModel.selectedBadgeInfo?.dateAcquired ?? "")")
                    .customFont(size: 14)
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
                        viewModel.dismissPopup()
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

// MARK: - Preview Provider
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
