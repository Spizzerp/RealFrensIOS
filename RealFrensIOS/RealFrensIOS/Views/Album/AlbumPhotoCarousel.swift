import SwiftUI

struct AlbumPhotoCarousel: View {
    let images: [String]
    @Binding var selectedPhotoIndex: Int
    
    var body: some View {
        GeometryReader { geometry in
            TabView(selection: $selectedPhotoIndex) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width - 40, height: geometry.size.height)
                        .clipped()
                        .cornerRadius(18)
                        .padding(.horizontal, 20)
                        .tag(index)
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        }
    }
}

// MARK: - Preview Provider
struct AlbumPhotoCarousel_Previews: PreviewProvider {
    static var previews: some View {
        AlbumPhotoCarousel(images: ["mock1", "mock2", "mock3"], selectedPhotoIndex: .constant(0))
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
