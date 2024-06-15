import SwiftUI

struct MapButtonView: View {
    let title: String
    let mapIndex: Int
    @Binding var selectedMap: Int
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(selectedMap == mapIndex ? Color(hex: "202020").opacity(0.8) : Color.clear)
                .frame(width: 140, height: 50)

            Button(action: {
                selectedMap = mapIndex
                if selectedMap == 2 {
                    NotificationCenter.default.post(name: .eventSelected, object: nil)
                }
            }) {
                Text(title)
                    .customFont(size: 14, weight: .bold)
                    .foregroundColor(.white.opacity(0.8))
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
            }
            .frame(width: 140, height: 50)
        }
        .zIndex(1)
    }
}
