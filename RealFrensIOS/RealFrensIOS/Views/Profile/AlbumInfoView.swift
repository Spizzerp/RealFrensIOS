import SwiftUI

// MARK: - Album Info View Component
/// AlbumInfoView displays an icon and count for album information.
struct AlbumInfoView: View {
    let icon: String
    let count: Int
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(Color(hex: "9F85FF"))
            Text("\(count)")
                .font(.custom("Switzer Variable", size: 14))
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "9F85FF"))
        }
    }
}

// MARK: - Preview Provider
struct AlbumInfoView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumInfoView(icon: "photo", count: 10)
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
