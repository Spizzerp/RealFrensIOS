import SwiftUI

struct AddPinButtonView: View {
    var body: some View {
        Button(action: {
            // Handle add pin action
        }) {
            Image(systemName: "pin.fill")
                .imageScale(.large)
                .foregroundColor(.white)
                .padding(10)
                .background(
                    Circle()
                        .fill(Color.black.opacity(0.5))
                )
                .shadow(color: .white, radius: 1)
        }
    }
}
