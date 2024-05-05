import SwiftUI

// MARK: - Album View
struct AlbumView: View {
    let album: Album
    @State private var comments: [String] = []
    @State private var newComment: String = ""
    
    var body: some View {
        ZStack {
            // MARK: - Background Gradients
            Color.black.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.clear]), startPoint: .bottom, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.clear]), startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            VStack {
                // MARK: - Scrollable Horizontal Image Row
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 40) {
                        ForEach(album.images, id: \.self) { image in
                            Image(image)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 320, height: 320)
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                        }
                    }
                    .padding()
                }
                
                // MARK: - Comments Section
                VStack {
                    customDivider
                    
                    ScrollView {
                        VStack(alignment: .leading, spacing: 20) {
                            ForEach(comments, id: \.self) { comment in
                                Text("Username: \(comment)")
                                    .foregroundColor(.white)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                    .font(.custom("Inter-Bold", size: 14))
                            }
                        }
                        .padding()
                    }
                    .frame(height: 150)
                    
                    customDivider
                    
                    // MARK: - Add Comment Section
                    HStack {
                        TextField("Add a comment", text: $newComment)
                            .padding()
                            .background(Color(hex: 0x202020))
                            .foregroundColor(.white)
                            .font(.custom("Inter-Bold", size: 14))
                            .frame(height: 40)
                            .cornerRadius(10)
                        
                        Button(action: {
                            if !newComment.isEmpty {
                                comments.append(newComment)
                                newComment = ""
                            }
                        }) {
                            Text("Post")
                                .foregroundColor(.white)
                                .padding(.horizontal, 20)
                                .padding(.vertical, 10)
                                .background(Color(hex: 0x333639))
                                .cornerRadius(10)
                                .font(.custom("Inter-Bold", size: 14))
                        }
                        .frame(width: 80, height: 40)
                    }
                    .padding()
                }
            }
            .padding(.bottom, 50)
        }
        .navigationBarTitle(album.title)
    }
    
    // MARK: - Custom Divider
    var customDivider: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.white)
            .opacity(0.35)
            .padding(.horizontal)
            .padding(.vertical, 10)
    }
}

// MARK: - Custom Color Extension
extension Color {
    init(hex: UInt, alpha: Double = 1) {
        self.init(
            .sRGB,
            red: Double((hex >> 16) & 0xff) / 255,
            green: Double((hex >> 8) & 0xff) / 255,
            blue: Double(hex & 0xff) / 255,
            opacity: alpha
        )
    }
}

// MARK: - Preview Provider
struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleAlbum = Album(id: 1, title: "Sample Album", coverImage: "sample_cover", images: ["mock1", "mock2", "mock3"])
        AlbumView(album: sampleAlbum)
    }
}
