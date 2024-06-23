import SwiftUI

/// A view that displays a list of conversations.
struct ConversationListView: View {
    // MARK: - Properties
    
    /// The view model that manages the conversation data.
    @ObservedObject var viewModel: MessageViewModel
    
    /// The current search text used to filter conversations.
    let searchText: String
    
    /// A binding to the currently selected conversation.
    @Binding var selectedConversation: Conversation?
    
    /// A binding to the flag that shows/hides the more options view.
    @Binding var showingMoreOptions: Bool

    // MARK: - Body
    
    var body: some View {
        List {
            ForEach(filteredConversations) { conversation in
                NavigationLink(destination: ConversationDetailView(conversation: conversation, viewModel: viewModel)) {
                    ConversationSummaryView(conversation: conversation)
                }
                .listRowBackground(Color.clear)
                .swipeActions(edge: .trailing, allowsFullSwipe: false) {
                    muteButton(for: conversation)
                    moreOptionsButton(for: conversation)
                }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    // MARK: - Helper Views
    
    private func muteButton(for conversation: Conversation) -> some View {
        Button(action: {
            viewModel.toggleMute(for: conversation)
        }) {
            Label(conversation.isMuted ? "Unmute" : "Mute", systemImage: conversation.isMuted ? "bell.slash.fill" : "bell.fill")
        }
        .tint(Color(hex: "631EE3"))
    }
    
    private func moreOptionsButton(for conversation: Conversation) -> some View {
        Button(action: {
            self.selectedConversation = conversation
            self.showingMoreOptions = true
        }) {
            Label("More", systemImage: "ellipsis")
        }
        .tint(.gray)
    }
    
    // MARK: - Computed Properties
    
    private var filteredConversations: [Conversation] {
        viewModel.conversations.filter {
            searchText.isEmpty ? true : $0.name.localizedCaseInsensitiveContains(searchText)
        }
    }
}
