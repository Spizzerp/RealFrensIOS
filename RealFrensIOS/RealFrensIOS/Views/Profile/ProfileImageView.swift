import SwiftUI

struct ProfileImageView: View {
    let imageURL: String?
    
    var body: some View {
        Group {
            if let imageURL = imageURL {
                Image(imageURL)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 180, height: 180)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.white.opacity(1), lineWidth: 3))
            } else {
                Circle()
                    .fill(Color.gray)
                    .frame(width: 180, height: 180)
                    .overlay(Circle().stroke(Color.white.opacity(1), lineWidth: 3))
            }
        }
        .padding(.top, 0)
    }
}
