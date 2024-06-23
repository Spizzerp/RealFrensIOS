import SwiftUI

/// A view that displays the details of a conversation, including messages.
struct ConversationDetailView: View {
    // MARK: - Properties
    
    /// The conversation to display.
    let conversation: Conversation
    
    /// The view model that manages the messaging data and logic.
    @ObservedObject var viewModel: MessageViewModel
    
    /// The text of the new message being composed.
    @State private var newMessageText = ""

    // MARK: - Body
    
    var body: some View {
        VStack {
            messageList
            messageInputField
        }
        .navigationBarTitle(conversation.name, displayMode: .inline)
        .background(Color(red: 0.13, green: 0.13, blue: 0.13).edgesIgnoringSafeArea(.all))
    }
    
    // MARK: - Subviews
    
    private var messageList: some View {
        ScrollView {
            LazyVStack {
                ForEach(conversation.messages) { message in
                    MessageBubble(message: message)
                }
            }
        }
        .background(BackgroundGradientView())
    }
    
    private var messageInputField: some View {
        HStack {
            TextField("Type a message...", text: $newMessageText)
                .font(.custom("Inter", size: 16))
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.horizontal)

            Button(action: sendMessage) {
                Image(systemName: "paperplane.fill")
                    .foregroundColor(.white)
            }
            .padding(.trailing)
        }
        .padding(.vertical)
        .background(Color(red: 0.13, green: 0.13, blue: 0.13))
    }
    
    // MARK: - Helper Methods
    
    private func sendMessage() {
        guard !newMessageText.isEmpty else { return }
        viewModel.sendMessage(newMessageText, in: conversation)
        newMessageText = ""
    }
}
