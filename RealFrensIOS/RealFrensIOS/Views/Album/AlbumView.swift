import SwiftUI

// MARK: - Album View
/// AlbumView displays the details of a photo album, including a photo carousel, description, and comments.
struct AlbumView: View {
    // MARK: - Properties
    @StateObject private var viewModel: AlbumViewModel
    @Environment(\.presentationMode) var presentationMode
    
    init(album: Album) {
        _viewModel = StateObject(wrappedValue: AlbumViewModel(album: album))
    }

    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                // Title Section
                AlbumTitleSection(album: viewModel.album, formattedDate: viewModel.formattedDate, dismissAction: {
                    self.presentationMode.wrappedValue.dismiss()
                })
                
                // Photo Carousel
                AlbumPhotoCarousel(images: viewModel.album.images, selectedPhotoIndex: $viewModel.selectedPhotoIndex)
                    .frame(height: 300)
                
                // Photo Thumbnails
                AlbumPhotoThumbnails(images: viewModel.album.images, selectedPhotoIndex: $viewModel.selectedPhotoIndex)
                    .frame(height: 40)
                
                // Description Section
                AlbumDescriptionSection(description: viewModel.album.description ?? "No description available.")
                
                // Divider
                Image("Divider")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 15)
                    .padding(.horizontal)
                    .padding(.vertical, -5)
                
                // Comments Section
                AlbumCommentsSection(comments: $viewModel.comments)
                
                // Add Comment Section
                AlbumAddCommentSection(newComment: $viewModel.newComment, addCommentAction: viewModel.addComment)
            }
            .padding(.top, -20)
            .background(Color(hex: "181818").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            // Tab Bar View
            VStack {
                Spacer()
                TabBarView(
                    onProfileSelected: {
                        print("Profile Selected")
                        // Navigate to Profile
                    },
                    onContentSelected: {
                        print("Content Selected")
                        // Navigate to Content
                    }
                )
                .padding(.bottom, 20)
                .background(Color.clear)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

// MARK: - Preview Provider
struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDate = Date()
        let sampleAlbum = Album(id: 1, title: "First NY Trip", coverImage: "mock1", images: ["mock1", "mock2", "mock3"], date: sampleDate, description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey.")
        AlbumView(album: sampleAlbum)
    }
}
