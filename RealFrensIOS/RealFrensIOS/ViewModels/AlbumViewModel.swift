import SwiftUI
import Combine

class AlbumViewModel: ObservableObject {
    @Published var album: Album
    @Published var selectedPhotoIndex: Int = 0
    @Published var comments: [String] = []
    @Published var newComment: String = ""

    private var cancellables = Set<AnyCancellable>()
    
    init(album: Album) {
        self.album = album
        self.loadMockData() // Call the function here
    }

    // MARK: - Load Mock Data
    func loadMockData() { // Change to public
        // This function simulates loading data from a backend
        // Replace this with actual network calls in the future
        self.comments = ["Congrats!!!!", "I love NY ^.^"]
    }

    // MARK: - Computed Properties
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: album.date)
    }

    // MARK: - Add Comment
    func addComment() {
        guard !newComment.isEmpty else { return }
        comments.append(newComment)
        newComment = ""
    }
}
