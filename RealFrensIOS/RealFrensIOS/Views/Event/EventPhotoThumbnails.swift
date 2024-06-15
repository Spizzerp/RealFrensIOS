import SwiftUI

struct EventPhotoThumbnails: View {
    let images: [String]
    @Binding var selectedPhotoIndex: Int
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 5) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: 32, height: 32)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                        .overlay(
                            RoundedRectangle(cornerRadius: 8)
                                .stroke(index == selectedPhotoIndex ? Color(red: 0.62, green: 0.52, blue: 1) : Color.clear, lineWidth: 2)
                        )
                        .padding(.vertical, 2)
                        .padding(.horizontal, 2)
                        .clipped()
                        .onTapGesture {
                            selectedPhotoIndex = index
                        }
                }
            }
            .padding(.horizontal)
            .padding(.vertical, 1)
        }
        .frame(height: 40)
    }
}

// MARK: - Preview Provider
struct EventPhotoThumbnails_Previews: PreviewProvider {
    static var previews: some View {
        EventPhotoThumbnails(images: ["Mocksgp1", "Mocksgp2", "Mocksgp3"], selectedPhotoIndex: .constant(0))
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
