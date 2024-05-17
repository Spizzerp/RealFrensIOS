import SwiftUI

// MARK: - Album View
struct AlbumView: View {
    let album: Album
    @State private var selectedPhotoIndex: Int = 0
    @State private var comments: [String] = ["Congrats!!!!", "I love NY ^.^"]
    @State private var newComment: String = ""
    
    var body: some View {
        VStack {
            // Title Section
            HStack {
                VStack(alignment: .leading) {
                    Text("Photo Album")
                        .font(.headline)
                        .foregroundColor(Color(red: 0.62, green: 0.52, blue: 1))
                    Text(album.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    Text("NY, USA, 2024") // Example location and year
                        .font(.subheadline)
                        .foregroundColor(Color.gray)
                }
                Spacer()
                Button(action: {
                    // Action to close the page
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .padding()
            
            // Photo Carousel
            GeometryReader { geometry in
                TabView(selection: $selectedPhotoIndex) {
                    ForEach(album.images.indices, id: \.self) { index in
                        Image(album.images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width - 40, height: geometry.size.height)
                            .clipped()
                            .cornerRadius(18)
                            .padding(.horizontal, 20) // Adding padding here
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .frame(height: 300)
            
            // Small photo thumbnails
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(album.images.indices, id: \.self) { index in
                        Image(album.images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 50, height: 50)
                            .cornerRadius(10)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(index == selectedPhotoIndex ? Color(red: 0.62, green: 0.52, blue: 1) : Color.clear, lineWidth: 2)
                            )
                            .padding(.vertical, 2) // Adding padding to avoid clipping issue
                            .clipped()
                            .onTapGesture {
                                selectedPhotoIndex = index
                            }
                    }
                }
                .padding(.horizontal)
            }
            .frame(height: 70)
            
            // Description Section
            VStack(alignment: .leading) {
                Text("First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey.")
                    .font(.body)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color(red: 0.08, green: 0.08, blue: 0.08))
            .cornerRadius(18)
            .padding(.horizontal)
            
            // Divider
            Image("Divider")
                .resizable()
                .scaledToFit()
                .frame(height: 15)
                .padding(.horizontal)
                .padding(.vertical, 1)
            
            // Comments Section
            VStack(alignment: .leading) {
                Text("Comments")
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .foregroundColor(Color.gray)
                
                ScrollView {
                    ForEach(comments, id: \.self) { comment in
                        CommentView(username: "User", comment: comment)
                    }
                }
                
                // Add Comment Section
                HStack {
                    TextField("Add a comment", text: $newComment)
                        .padding()
                        .background(Color(hex: 0x202020))
                        .foregroundColor(.white)
                        .font(.custom("Inter-Bold", size: 14))
                        .frame(height: 40)
                        .cornerRadius(10)
                    
                    Button(action: {
                        if (!newComment.isEmpty) {
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
            .padding(.bottom, 50)
        }
        .background(Color.black.edgesIgnoringSafeArea(.all))
        .navigationBarTitle(album.title, displayMode: .inline)
    }
}

// MARK: - Comment View
struct CommentView: View {
    let username: String
    let comment: String
    
    var body: some View {
        HStack {
            Circle()
                .fill(Color.gray)
                .frame(width: 24, height: 24)
            VStack(alignment: .leading) {
                Text(username)
                    .font(.caption)
                    .fontWeight(.medium)
                    .foregroundColor(Color(red: 0.62, green: 0.52, blue: 1))
                Text(comment)
                    .font(.caption)
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, 2)
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

// Preview Provider
struct AlbumView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleAlbum = Album(id: 1, title: "First NY Trip", coverImage: "mock1", images: ["mock1", "mock2", "mock3"])
        AlbumView(album: sampleAlbum)
    }
}
