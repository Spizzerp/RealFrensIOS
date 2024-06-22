import Foundation

struct Conversation: Identifiable {
    let id: UUID
    let name: String
    let profilePicture: String
    var lastMessage: String
    var lastMessageTime: String
    var messages: [Message]

    init(id: UUID = UUID(), name: String, profilePicture: String, lastMessage: String, lastMessageTime: String, messages: [Message] = []) {
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
        self.messages = messages
    }
}
