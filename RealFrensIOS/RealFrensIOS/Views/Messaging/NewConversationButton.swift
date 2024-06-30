import SwiftUI

/// A button that triggers navigation to the new conversation view.
struct NewConversationButton: View {
    /// Binding to control navigation to the new conversation view
    @Binding var isShowingNewConversationView: Bool
    
    /// Initialize the button with an optional binding
    /// - Parameter isShowingNewConversationView: Binding to control the presentation of the new conversation view
    init(isShowingNewConversationView: Binding<Bool>? = nil) {
        self._isShowingNewConversationView = isShowingNewConversationView ?? .constant(false)
    }

    var body: some View {
        ZStack {
            Color.clear // Use clear color to allow touch events to pass through
            VStack {
                Spacer() // Push the button to the bottom
                HStack {
                    Spacer() // Push the button to the right
                    Button(action: {
                        isShowingNewConversationView = true
                    }) {
                        Image(systemName: "plus")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(Color(hex: "1A1B1B"))
                            .frame(width: 60, height: 60)
                            .background(Color(hex: "9F85FF")) // Updated color
                            .clipShape(Circle())
                            .shadow(color: Color(hex: "9F85FF").opacity(0.3), radius: 10, x: 0, y: 5)
                    }
                    .padding(.trailing, 20)
                    .padding(.bottom, 150)
                }
            }
        }
        .edgesIgnoringSafeArea(.all) // Ensure the ZStack covers the entire screen
    }
}

// MARK: - Preview
struct NewConversationButton_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Dark background for visibility
            NewConversationButton(isShowingNewConversationView: .constant(false))
        }
    }
}
