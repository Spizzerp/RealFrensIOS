import SwiftUI

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
                    VStack(spacing: 10) {
                        ProfileImageView(imageURL: viewModel.user?.profileImageURL)
                        StatView(viewModel: viewModel)
                        UserInfoSection(viewModel: viewModel)
                        CustomDivider()
                        BadgeSection(viewModel: viewModel)
                        CustomDivider()
                        AlbumSection(viewModel: viewModel)
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

// MARK: - Preview Provider
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(onDismiss: {})
    }
}
