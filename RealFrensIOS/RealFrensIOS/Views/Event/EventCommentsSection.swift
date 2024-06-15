import SwiftUI

struct EventCommentsSection: View {
    @Binding var comments: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Comments")
                .font(.subheadline)
                .fontWeight(.medium)
                .foregroundColor(Color.gray)
                .padding(.horizontal, 20)
                .padding(.vertical, -5)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 5) {
                    ForEach(comments.indices, id: \.self) { index in
                        EventCommentView(username: "User\(index + 1)", comment: comments[index], profileImage: index % 2 == 0 ? "pfp5" : "pfp2")
                    }
                }
                .padding(.horizontal, 10)
            }
        }
    }
}

// MARK: - Preview Provider
struct EventCommentsSection_Previews: PreviewProvider {
    static var previews: some View {
        EventCommentsSection(comments: .constant(["Looking forward to this event!", "Can't wait to be there!"]))
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
