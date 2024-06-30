import Foundation

/// Represents a conversation in the messaging app.
struct Conversation: Identifiable {
    /// Unique identifier for the conversation
    let id: UUID
    
    /// Name of the conversation or the other participant
    let name: String
    
    /// Name of the image file for the conversation's profile picture
    let profilePicture: String
    
    /// The text of the most recent message in the conversation
    var lastMessage: String
    
    /// The timestamp of the most recent message, formatted as a string
    var lastMessageTime: String
    
    /// An array of all messages in the conversation
    var messages: [Message]
    
    /// Indicates whether the user has muted notifications for this conversation
    var isMuted: Bool
    
    /// Indicates whether there are any unread messages in the conversation
    var hasUnreadMessages: Bool
    
    /// Indicates whether this is a group conversation
    var isGroup: Bool

    /// Initializes a new Conversation instance
    /// - Parameters:
    ///   - id: The unique identifier for the conversation (default is a new UUID)
    ///   - name: The name of the conversation or the other participant
    ///   - profilePicture: The name of the image file for the profile picture
    ///   - lastMessage: The text of the most recent message
    ///   - lastMessageTime: The timestamp of the most recent message
    ///   - messages: An array of all messages in the conversation (default is empty)
    ///   - isMuted: Whether the conversation is muted (default is false)
    ///   - hasUnreadMessages: Whether there are unread messages (default is false)
    ///   - isGroup: Whether this is a group conversation (default is false)
    init(id: UUID = UUID(), name: String, profilePicture: String, lastMessage: String, lastMessageTime: String, messages: [Message] = [], isMuted: Bool = false, hasUnreadMessages: Bool = false, isGroup: Bool = false) {
        self.id = id
        self.name = name
        self.profilePicture = profilePicture
        self.lastMessage = lastMessage
        self.lastMessageTime = lastMessageTime
        self.messages = messages
        self.isMuted = isMuted
        self.hasUnreadMessages = hasUnreadMessages
        self.isGroup = isGroup
    }
}
