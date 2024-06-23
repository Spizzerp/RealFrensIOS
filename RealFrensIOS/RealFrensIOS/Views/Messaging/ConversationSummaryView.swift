import SwiftUI

/// A view that represents a summary of a single conversation in the list.
struct ConversationSummaryView: View {
    // MARK: - Properties
    
    /// The conversation to display.
    let conversation: Conversation

    // MARK: - Body
    
    var body: some View {
        HStack {
            profilePicture
            conversationInfo
            Spacer()
            timeAndMuteStatus
        }
        .padding(.vertical, 8)
    }
    
    // MARK: - Subviews
    
    private var profilePicture: some View {
        Image(conversation.profilePicture)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(width: 50, height: 50)
            .clipShape(Circle())
    }
    
    private var conversationInfo: some View {
        VStack(alignment: .leading) {
            Text(conversation.name)
                .font(.custom("Inter", size: 16))
                .foregroundColor(.gray)
            Text(conversation.lastMessage)
                .font(.custom("Inter", size: 14))
                .foregroundColor(.gray)
        }
    }
    
    private var timeAndMuteStatus: some View {
        VStack(alignment: .trailing) {
            Text(conversation.lastMessageTime)
                .font(.custom("Inter", size: 12))
                .foregroundColor(.gray)
            
            if conversation.isMuted {
                Image(systemName: "bell.slash.fill")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
            }
        }
    }
}
