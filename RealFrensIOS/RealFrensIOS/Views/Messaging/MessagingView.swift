import SwiftUI

struct MessagingView: View {
    @StateObject private var viewModel = MessageViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.conversations) { conversation in
                    NavigationLink(destination: ConversationDetailView(conversation: conversation, viewModel: viewModel)) {
                        ConversationRowView(conversation: conversation)
                    }
                }
                .onDelete(perform: deleteConversation)
            }
            .listStyle(PlainListStyle())
            .navigationBarTitle("Messages", displayMode: .inline)
            .navigationBarItems(
                leading: EditButton(),
                trailing: Button(action: {
                    viewModel.startNewConversation()
                }) {
                    Image(systemName: "square.and.pencil")
                }
            )
        }
        .accentColor(Color(hex: "9F85FF"))
    }

    private func deleteConversation(at offsets: IndexSet) {
        viewModel.conversations.remove(atOffsets: offsets)
    }
}

struct ConversationRowView: View {
    let conversation: Conversation

    var body: some View {
        HStack {
            Image(conversation.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 50, height: 50)
                .clipShape(Circle())

            VStack(alignment: .leading) {
                Text(conversation.name)
                    .font(.headline)
                Text(conversation.lastMessage)
                    .font(.subheadline)
                    .foregroundColor(.gray)
            }

            Spacer()

            Text(conversation.lastMessageTime)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding(.vertical, 8)
    }
}

struct ConversationDetailView: View {
    let conversation: Conversation
    @ObservedObject var viewModel: MessageViewModel
    @State private var newMessageText = ""

    var body: some View {
        VStack {
            ScrollView {
                ForEach(conversation.messages) { message in
                    MessageBubble(message: message)
                }
            }

            HStack {
                TextField("Type a message...", text: $newMessageText)
                    .textFieldStyle(RoundedBorderTextFieldStyle())

                Button(action: sendMessage) {
                    Image(systemName: "paperplane.fill")
                        .foregroundColor(Color(hex: "9F85FF"))
                }
            }
            .padding()
        }
        .navigationBarTitle(conversation.name, displayMode: .inline)
        .background(Color(hex: "181818").edgesIgnoringSafeArea(.all))
    }

    private func sendMessage() {
        guard !newMessageText.isEmpty else { return }
        viewModel.sendMessage(newMessageText, in: conversation)
        newMessageText = ""
    }
}

struct MessageBubble: View {
    let message: Message

    var body: some View {
        HStack {
            if message.isFromCurrentUser {
                Spacer()
            }
            Text(message.content)
                .padding()
                .background(message.isFromCurrentUser ? Color(hex: "9F85FF") : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(15)
            if !message.isFromCurrentUser {
                Spacer()
            }
        }
        .padding(.horizontal)
    }
}

// MARK: - Preview Provider
struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingView()
    }
}
