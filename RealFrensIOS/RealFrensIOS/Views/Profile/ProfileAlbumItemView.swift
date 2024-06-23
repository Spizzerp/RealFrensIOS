import SwiftUI

struct ProfileAlbumItemView: View {
    let album: Album

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(album.coverImage)
                .resizable()
                .scaledToFill()
                .frame(width: 250, height: 150)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(radius: 5)
                .padding(.vertical, 10)

            VStack {
                Spacer()
                    .frame(maxHeight: 10)

                HStack {
                    AlbumInfoItem(icon: "photo", count: album.images.count)
                    Spacer()
                    AlbumInfoItem(icon: "heart", count: 100) // Replace with actual data
                    Spacer()
                    AlbumInfoItem(icon: "bubble.left", count: 20) // Replace with actual data
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 10)
            }
            .background(
                RoundedCorners(color: Color(hex: "121212"), tl: 0, tr: 0, bl: 10, br: 10)
            )
        }
    }
}

private struct AlbumInfoItem: View {
    let icon: String
    let count: Int
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(hex: "9F85FF"))
            Text("\(count)")
                .font(.custom("Inter", size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "9F85FF"))
        }
    }
}
