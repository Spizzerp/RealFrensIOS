import SwiftUI

// MARK: - Album View
struct AlbumView: View {
    let album: Album
    @State private var selectedPhotoIndex: Int = 0
    @State private var comments: [String] = ["Congrats!!!!", "I love NY ^.^"]
    @State private var newComment: String = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            // MARK: - Title Section
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
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "xmark")
                        .foregroundColor(.white)
                        .padding()
                }
            }
            .padding()
            
            // MARK: - Photo Carousel
            GeometryReader { geometry in
                TabView(selection: $selectedPhotoIndex) {
                    ForEach(album.images.indices, id: \.self) { index in
                        Image(album.images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: geometry.size.width - 40, height: geometry.size.height)
                            .clipped()
                            .cornerRadius(18)
                            .padding(.horizontal, 20)
                            .tag(index)
                    }
                }
                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            }
            .frame(height: 300)
            
            // MARK: - Small Photo Thumbnails
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 10) {
                    ForEach(album.images.indices, id: \.self) { index in
                        Image(album.images[index])
                            .resizable()
                            .scaledToFill()
                            .frame(width: 32, height: 32)
                            .clipShape(RoundedRectangle(cornerRadius: 8))
                            .overlay(
                                RoundedRectangle(cornerRadius: 8)
                                    .stroke(index == selectedPhotoIndex ? Color(red: 0.62, green: 0.52, blue: 1) : Color.clear, lineWidth: 2)
                            )
                            .padding(.vertical, 2)
                            .padding(.horizontal, 2)
                            .clipped()
                            .onTapGesture {
                                selectedPhotoIndex = index
                            }
                    }
                }
                .padding(.horizontal)
                .padding(.vertical, 1)
            }
            .frame(height: 40)
            
            // MARK: - Description Section
            VStack(alignment: .leading) {
                Text("First day of my Web3 job. It was an amazing experience exploring the city and starting my new journey.")
                    .font(.caption)
                    .foregroundColor(.white)
            }
            .padding()
            .background(Color(hex: 0x131313)) // Updated color
            .cornerRadius(20)
            .padding(.horizontal)
            .padding(.vertical, 1)
            
            // MARK: - Divider
            Image("Divider")
                .resizable()
                .scaledToFit()
                .frame(height: 15)
                .padding(.horizontal)
                .padding(.vertical, -5)
            
            // MARK: - Comments Section
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
                            CommentView(username: "User\(index + 1)", comment: comments[index], profileImage: index % 2 == 0 ? "pfp5" : "pfp2")
                        }
                    }
                    .padding(.horizontal, 10)
                }
                
                // MARK: - Add Comment Section
                VStack {
    
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
                        .frame(height: 40)
                    }
                    .padding(.horizontal)
                    .padding(.vertical, 5)
                }
                .padding(.bottom, 65)
            }
        }
        .padding(.top, -20) // Adding padding to move content up
        .background(Color(hex: 0x181818).edgesIgnoringSafeArea(.all))
        .navigationBarHidden(true) // Hides the navigation bar
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Comment View
struct CommentView: View {
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
            .padding(.leading, 8) // Added padding to move the text to the right
            
            Spacer()
            
            Button(action: {
                isLiked.toggle()
            }) {
                Image(systemName: isLiked ? "heart.fill" : "heart")
                    .foregroundColor(Color(hex: 0x9F85FF))
                    .frame(width: 24, height: 24)
                    .padding(.trailing, 10)
            }
        }
        .padding(.vertical, 2)
        .padding(.leading, 20) // Added padding to move the entire HStack to the right
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
        let sampleAlbum = Album(id: 1, title: "First NY Trip", coverImage: "mock1", images: ["mock1", "mock2", "mock3"])
        AlbumView(album: sampleAlbum)
    }
}
