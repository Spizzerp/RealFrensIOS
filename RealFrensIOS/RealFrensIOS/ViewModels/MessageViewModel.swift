import Foundation

class MessageViewModel: ObservableObject {
    @Published var conversations: [Conversation] = []

    init() {
        loadConversations()
    }

    private func loadConversations() {
        // Mock data
        conversations = [
            Conversation(name: "Alice", profilePicture: "pfp5", lastMessage: "Hey, how are you?", lastMessageTime: "2m ago", messages: []),
            Conversation(name: "Bob", profilePicture: "pfp1", lastMessage: "See you tomorrow!", lastMessageTime: "1h ago", messages: [])
        ]
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

    func toggleMute(for conversation: Conversation) {
        if let index = conversations.firstIndex(where: { $0.id == conversation.id }) {
            conversations[index].isMuted.toggle()
        }
    }

    func startNewConversation() {
        // In a real app, this would open a new view to select a contact
        print("Starting a new conversation")
    }

    func deleteConversation(at offsets: IndexSet) {
        conversations.remove(atOffsets: offsets)
    }
}
