import SwiftUI

struct AlbumSection: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(viewModel.albums) { album in
                    NavigationLink(destination: AlbumView(album: album, onDismiss: {
                        print("Navigating back from Album to Profile")
                    })) {
                        ProfileAlbumItemView(album: album)
                    }
                }
            }
            .padding(.horizontal)
        }
    }
}
