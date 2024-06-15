import SwiftUI

struct AlbumDescriptionSection: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .center) {
            Text(description)
                .font(.caption)
                .foregroundColor(.white)
                .padding(.vertical, 5)
                .fixedSize(horizontal: false, vertical: true)
                .frame(minWidth: 320, maxWidth: 320, alignment: .leading)
        }
        .padding()
        .background(Color(hex: "131313"))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.vertical, 1)
        .fixedSize(horizontal: true, vertical: false)
    }
}

// MARK: - Preview Provider
struct AlbumDescriptionSection_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDescriptionSection(description: "First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey.")
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
