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
                .foregroundColor(.white)
                .cornerRadius(15)
            
            if !message.isFromCurrentUser { Spacer() }
        }
        .padding(.horizontal)
    }
    
    // MARK: - Computed Properties
    
    private var backgroundGradient: some ShapeStyle {
        message.isFromCurrentUser ?
            Color(red: 0.4, green: 0.35, blue: 0.7) :
            Color.gray
    }
}
