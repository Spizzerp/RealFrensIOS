import SwiftUI

struct EventIndicatorView: View {
    @Binding var currentEventIndex: Int
    
    var body: some View {
        HStack(spacing: 8) {
            ForEach(0..<2) { index in
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(index == currentEventIndex ? Color(hex: "9E85FF") : Color(hex: "D9D9D9").opacity(0.29))
            }
        }
    }
}
