import SwiftUI

/// A view that displays a list of conversations with filtering and search capabilities.
struct ConversationListView: View {
    // MARK: - Properties
    
    /// The view model that manages conversation data and logic
    @ObservedObject var viewModel: MessageViewModel
    
    /// The current search text used to filter conversations
    let searchText: String
    
    /// Binding to the currently selected conversation
    @Binding var selectedConversation: Conversation?
    
    /// Controls the visibility of the more options sheet
    @Binding var showingMoreOptions: Bool
    
    /// The color used for usernames in the conversation list
    let usernameColor: Color
    
    /// The currently selected filter option
    let filter: FilterView.Filter

    // MARK: - Body
    
    var body: some View {
        List {
            ForEach(filteredConversations) { conversation in
                NavigationLink(destination: ConversationDetailView(conversation: conversation, viewModel: viewModel)) {
                    ConversationRow(conversation: conversation, usernameColor: usernameColor)
                }
                .listRowBackground(Color.clear)
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    // Mute/Unmute button
                    Button(action: { viewModel.toggleMute(for: conversation) }) {
                        Label(conversation.isMuted ? "Unmute" : "Mute", systemImage: conversation.isMuted ? "bell.slash.fill" : "bell.fill")
                    }
                    .tint(Color(hex: "631EE3"))
                    
                    // More options button
                    Button(action: {
                        self.selectedConversation = conversation
                        self.showingMoreOptions = true
                    }) {
                        Label("More", systemImage: "ellipsis")
                    }
                    .tint(.gray)
                }
            }
        }
        .listStyle(PlainListStyle())
    }

    // MARK: - Filtered Conversations
    
    /// Returns a filtered list of conversations based on the search text and selected filter
    private var filteredConversations: [Conversation] {
        viewModel.conversations.filter { conversation in
            let matchesSearch = searchText.isEmpty || conversation.name.localizedCaseInsensitiveContains(searchText)
            let matchesFilter: Bool
            switch filter {
            case .all:
                matchesFilter = true
            case .unread:
                matchesFilter = conversation.hasUnreadMessages
            case .groups:
                matchesFilter = conversation.isGroup
            }
            return matchesSearch && matchesFilter
        }
    }
}

/// Represents a single row in the conversation list
struct ConversationRow: View {
    let conversation: Conversation
    let usernameColor: Color
    
    var body: some View {
        HStack(spacing: 12) {
            // Profile picture
            Image(conversation.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            // Conversation details
            VStack(alignment: .leading, spacing: 4) {
                Text(conversation.name)
                    .font(.headline)
                    .foregroundColor(usernameColor)
                Text(conversation.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
                    .lineLimit(1)
            }
            
            Spacer()
            
            // Time and mute status
            VStack(alignment: .trailing, spacing: 4) {
                Text(conversation.lastMessageTime)
                    .font(.caption)
                    .foregroundColor(.gray)
                if conversation.isMuted {
                    Image(systemName: "bell.slash.fill")
                        .foregroundColor(.gray)
                        .font(.caption)
                }
            }
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Preview

struct ConversationListView_Previews: PreviewProvider {
    static var previews: some View {
        ConversationListView(
            viewModel: MessageViewModel(),
            searchText: "",
            selectedConversation: .constant(nil),
            showingMoreOptions: .constant(false),
            usernameColor: Color(hex: "9F85FF"),
            filter: .all
        )
    }
}
