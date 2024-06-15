import SwiftUI

struct EventAddCommentSection: View {
    @Binding var newComment: String
    var addCommentAction: () -> Void
    
    var body: some View {
        VStack {
            HStack {
                TextField("Add a comment", text: $newComment)
                    .padding()
                    .background(Color(hex: "202020"))
                    .foregroundColor(.white)
                    .font(.custom("Inter-Bold", size: 14))
                    .frame(height: 40)
                    .cornerRadius(10)
                
                Button(action: {
                    addCommentAction()
                }) {
                    Text("Post")
                        .foregroundColor(.white)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .background(Color(hex: "333639"))
                        .cornerRadius(10)
                        .font(.custom("Inter-Bold", size: 14))
                }
                .frame(height: 40)
            }
            .padding(.horizontal)
            .padding(.vertical, 5)
        }
        .padding(.bottom, 65)
    }
}

// MARK: - Preview Provider
struct EventAddCommentSection_Previews: PreviewProvider {
    static var previews: some View {
        EventAddCommentSection(newComment: .constant(""), addCommentAction: {})
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
