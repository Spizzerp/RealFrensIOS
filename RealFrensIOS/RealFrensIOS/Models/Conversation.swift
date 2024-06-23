import Foundation

struct Conversation: Identifiable {
    let id: UUID
    let name: String
    let profilePicture: String
    var lastMessage: String
    var lastMessageTime: String
    var messages: [Message]
    var isMuted: Bool

    init(id: UUID = UUID(), name: String, profilePicture: String, lastMessage: String, lastMessageTime: String, messages: [Message] = [], isMuted: Bool = false) {
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
        self.messages = messages
        self.isMuted = isMuted
    }
}
