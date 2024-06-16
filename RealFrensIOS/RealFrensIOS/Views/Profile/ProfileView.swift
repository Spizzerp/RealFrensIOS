import SwiftUI

// MARK: - Profile View
struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    var onDismiss: () -> Void

    init(onDismiss: @escaping () -> Void) {
        self.onDismiss = onDismiss
    }

    var body: some View {
        NavigationView {
            ZStack {
                BackgroundView()
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack {
                        ProfileImageSection(viewModel: viewModel)
                        StatIndicatorSection(viewModel: viewModel)
                        UsernameDescriptionSection(viewModel: viewModel)
                        CustomDivider()
                        BadgeRow(viewModel: viewModel)
                        CustomDivider()
                        AlbumRow(viewModel: viewModel)
                    }
                    .padding(.top, UIScreen.main.bounds.height * 0.02)
                }

                HamburgerMenuButton()

                if viewModel.showingPopup {
                    BadgePopupView(viewModel: viewModel)
                }
            }
        }
    }
}

// MARK: - Background View
private struct BackgroundView: View {
    var body: some View {
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
}

// MARK: - Profile Image Section
private struct ProfileImageSection: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        Group {
            if let profileImageURL = viewModel.user?.profileImageURL {
                Image(profileImageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white.opacity(1), lineWidth: 3))
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 180, height: 180)
                    .overlay(Circle().stroke(Color.white.opacity(1), lineWidth: 3))
            }
        }
        .padding(.top, 0)
    }
}

// MARK: - Stat Indicator Section
private struct StatIndicatorSection: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        HStack(spacing: 35) {
            StatView(count: "\(viewModel.frensCount)", label: "Frens", countColor: Color(hex: "9F85FF"))
            StatView(count: "\(viewModel.pinsCount)", label: "Pins", countColor: Color(hex: "9F85FF"))
            StatView(count: "\(viewModel.level)", label: "Level", countColor: Color(hex: "9F85FF"))
        }
        .padding(.vertical, 25)
    }
}

// MARK: - Username and Description Section
private struct UsernameDescriptionSection: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text(viewModel.user?.username ?? "")
                    .font(.custom("Inter", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(red: 159/255, green: 133/255, blue: 255/255))

                TipButton()
            }

            Text(viewModel.user?.bio ?? "")
                .font(.custom("Inter", size: 16))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

// MARK: - Tip Button
private struct TipButton: View {
    var body: some View {
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
                    .font(.custom("Inter", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(Color(hex: "9F85FF"))
            .cornerRadius(6)
        }
    }
}

// MARK: - Custom Divider
private struct CustomDivider: View {
    var body: some View {
        Image("Divider")
            .resizable()
            .scaledToFit()
            .frame(height: 15)
            .padding(.horizontal)
            .padding(.vertical, 1)
    }
}

// MARK: - Badge Row
private struct BadgeRow: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        HStack {
            Spacer()
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15) {
                    ForEach(viewModel.badges) { badge in
                        Image(badge.imageName)
                            .resizable()
                            .scaledToFit()
                            .frame(width: 50, height: 50)
                            .shadow(radius: 3)
                            .onTapGesture {
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
}

// MARK: - Album Row
private struct AlbumRow: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(viewModel.albums) { album in
                    NavigationLink(destination: AlbumView(album: album, onDismiss: {
                        print("Navigating back from Album to Profile")
                    })) {
                        AlbumItemView(album: album)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}

// MARK: - Album Item View
private struct AlbumItemView: View {
    var album: Album

    var body: some View {
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

// MARK: - Hamburger Menu Button
private struct HamburgerMenuButton: View {
    var body: some View {
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
}

// MARK: - Badge Popup View
private struct BadgePopupView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                Text(viewModel.selectedBadgeInfo?.title ?? "")
                    .font(.custom("Inter", size: 18))
                    .fontWeight(.bold)
                    .padding()

                Text(viewModel.selectedBadgeInfo?.description ?? "")
                    .font(.custom("Inter", size: 16))

                Text("Acquired: \(viewModel.selectedBadgeInfo?.dateAcquired ?? "")")
                    .font(.custom("Inter", size: 14))
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
        ProfileView(onDismiss: {})
    }
}
