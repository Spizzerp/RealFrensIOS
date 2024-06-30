import SwiftUI

/// A view that represents a single message bubble in the conversation.
struct MessageBubble: View {
    // MARK: - Properties
    
    /// The message to display.
    let message: Message

    // MARK: - Body
    
    var body: some View {
        HStack {
            if message.isFromCurrentUser { Spacer() }
            
            Text(message.content)
                .font(.custom("Inter", size: 16))
                .padding()
                .background(backgroundGradient)
                .foregroundColor(message.isFromCurrentUser ? .black : .white)
                .cornerRadius(15)
            
            if !message.isFromCurrentUser { Spacer() }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Computed Properties
    
    /// Determines the background color of the message bubble.
    /// For the current user's messages, it uses #9F85FF (light purple).
    /// For other users' messages, it uses a gray color.
    private var backgroundGradient: some ShapeStyle {
        message.isFromCurrentUser ?
            Color(hex: "9F85FF") : // Light purple for current user's messages
            Color.gray
    }
}
