import SwiftUI

/// A view that displays additional options for a conversation.
struct MoreOptionsView: View {
    // MARK: - Properties
    
    /// The conversation for which to show options.
    let conversation: Conversation
    
    /// The presentation mode used to dismiss the view.
    @Environment(\.presentationMode) var presentationMode

    // MARK: - Body
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            HeaderView(conversation: conversation, presentationMode: _presentationMode)
            
            OptionButton(text: "Follow", imageName: "person.badge.plus", action: followAction)
            OptionButton(text: "Pin", imageName: "pin", action: pinAction)
            OptionButton(text: "Snooze", imageName: "bell.slash", action: snoozeAction)
            OptionButton(text: "Mark as unread", imageName: "envelope.badge", action: markAsUnreadAction)
            OptionButton(text: "Archive", imageName: "archivebox", action: archiveAction)
            
            OptionButton(text: "Delete", imageName: "trash", color: .red, action: deleteAction)
        }
        .padding()
        .background(Color(red: 0.13, green: 0.13, blue: 0.13))
        .foregroundColor(.white)
    }
    
    // MARK: - Action Methods
    
    private func followAction() {
        // Implement follow action
    }
    
    private func pinAction() {
        // Implement pin action
    }
    
    private func snoozeAction() {
        // Implement snooze action
    }
    
    private func markAsUnreadAction() {
        // Implement mark as unread action
    }
    
    private func archiveAction() {
        // Implement archive action
    }
    
    private func deleteAction() {
        // Implement delete action
    }
}

/// A view that displays the header of the MoreOptionsView.
private struct HeaderView: View {
    // MARK: - Properties
    
    /// The conversation to display in the header.
    let conversation: Conversation
    
    /// The presentation mode used to dismiss the view.
    @Environment(\.presentationMode) var presentationMode

    // MARK: - Body
    
    var body: some View {
        HStack {
            Image(conversation.profilePicture)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 60, height: 60)
                .clipShape(Circle())
            VStack(alignment: .leading) {
                Text(conversation.name)
                    .font(.custom("Inter", size: 18))
                Text("@\(conversation.name.lowercased())")
                    .font(.custom("Inter", size: 14))
                    .foregroundColor(.gray)
            }
            Spacer()
            Button(action: {
                presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
            }
        }
    }
}

/// A button used in the MoreOptionsView.
private struct OptionButton: View {
    // MARK: - Properties
    
    let text: String
    let imageName: String
    var color: Color = .white
    let action: () -> Void
    
    // MARK: - Body
    
    var body: some View {
        Button(action: action) {
            HStack {
                Text(text)
                    .font(.custom("Inter", size: 16))
                Spacer()
                Image(systemName: imageName)
            }
            .foregroundColor(color)
        }
        .buttonStyle(PlainButtonStyle())
    }
}
