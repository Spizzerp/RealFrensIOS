import SwiftUI

struct EventPhotoCarousel: View {
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
        .frame(height: 200)
    }
}

// MARK: - Preview Provider
struct EventPhotoCarousel_Previews: PreviewProvider {
    static var previews: some View {
        EventPhotoCarousel(images: ["Mocksgp1", "Mocksgp2", "Mocksgp3"], selectedPhotoIndex: .constant(0))
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
