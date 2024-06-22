import Foundation

class MessageViewModel: ObservableObject {
    @Published var conversations: [Conversation] = []
    @Published var isEditMode: Bool = false

    init() {
        loadConversations()
    }

    private func loadConversations() {
        // TODO: Replace this with actual data loading logic
        conversations = [
            Conversation(name: "Alice", profilePicture: "alice_profile", lastMessage: "Hey, how are you?", lastMessageTime: "2m ago"),
            Conversation(name: "Bob", profilePicture: "bob_profile", lastMessage: "See you tomorrow!", lastMessageTime: "1h ago")
        ]
    }

    func startNewConversation() {
        // TODO: Implement logic to start a new conversation
        let newConversation = Conversation(name: "New Contact", profilePicture: "default_profile", lastMessage: "", lastMessageTime: "Now")
        conversations.append(newConversation)
    }

    func toggleEditMode() {
        isEditMode.toggle()
    }

    func sendMessage(_ content: String, in conversation: Conversation) {
        let newMessage = Message(content: content, isFromCurrentUser: true)
        if let index = conversations.firstIndex(where: { $0.id == conversation.id }) {
            conversations[index].messages.append(newMessage)
            conversations[index].lastMessage = content
            conversations[index].lastMessageTime = "Just now"
            
            // Move the updated conversation to the top of the list
            let updatedConversation = conversations.remove(at: index)
            conversations.insert(updatedConversation, at: 0)
        }
    }

    func deleteConversation(at offsets: IndexSet) {
        conversations.remove(atOffsets: offsets)
    }
}
