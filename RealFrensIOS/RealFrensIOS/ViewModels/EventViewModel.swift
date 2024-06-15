import Combine
import SwiftUI

class EventViewModel: ObservableObject {
    @Published var event: Event
    @Published var selectedPhotoIndex: Int = 0
    @Published var comments: [String] = ["Looking forward to this event!", "Can't wait to be there!"]
    @Published var newComment: String = ""
    
    init(event: Event) {
        self.event = event
    }

    // MARK: - Add Comment
    func addComment() {
        guard !newComment.isEmpty else { return }
        comments.append(newComment)
        newComment = ""
    }
}
