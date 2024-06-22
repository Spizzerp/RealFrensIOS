import Foundation

struct Message: Identifiable {
    let id: UUID
    let content: String
    let timestamp: Date
    let isFromCurrentUser: Bool

    init(id: UUID = UUID(), content: String, timestamp: Date = Date(), isFromCurrentUser: Bool) {
        self.id = id
        self.content = content
        self.timestamp = timestamp
        self.isFromCurrentUser = isFromCurrentUser
    }
}
