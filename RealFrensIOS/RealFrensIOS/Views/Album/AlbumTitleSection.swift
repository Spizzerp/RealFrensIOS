import SwiftUI

struct AlbumTitleSection: View {
    let album: Album
    let formattedDate: String
    let dismissAction: () -> Void
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Photo Album")
                    .font(.headline)
                    .foregroundColor(Color(red: 0.62, green: 0.52, blue: 1))
                Text(album.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text("NY, USA, \(formattedDate)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            Spacer()
            Button(action: {
                dismissAction()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .padding()
    }
}

// MARK: - Preview Provider
struct AlbumTitleSection_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDate = Date()
        let sampleAlbum = Album(id: 1, title: "First NY Trip", coverImage: "mock1", images: ["mock1", "mock2", "mock3"], date: sampleDate, description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey.")
        AlbumTitleSection(album: sampleAlbum, formattedDate: "06/14/2024", dismissAction: {})
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
