import SwiftUI

// MARK: - Comment View
/// CommentView displays a single comment with the user's profile image.
struct AlbumCommentView: View {
    let username: String
    let comment: String
    let profileImage: String
    @State private var isLiked: Bool = false
    
    var body: some View {
        HStack {
            Image(profileImage)
                .resizable()
                .frame(width: 24, height: 24)
                .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(username)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.62, green: 0.52, blue: 1))
                Text(comment)
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding(.leading, 8)
            
            Spacer()
            
            Button(action: {
                isLiked.toggle()
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(Color(hex: "9F85FF"))
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 10)
            }
        }
        .padding(.vertical, 2)
        .padding(.leading, 20)
    }
}

// MARK: - Preview Provider
struct AlbumCommentView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumCommentView(username: "User1", comment: "This is a comment", profileImage: "pfp5")
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
