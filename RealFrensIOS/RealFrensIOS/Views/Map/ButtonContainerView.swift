import SwiftUI

struct ButtonContainerView: View {
    @Binding var selectedMap: Int
    
    var body: some View {
        VStack {
            ZStack {
                Capsule(style: .continuous)
                    .fill(Color(hex: "FFFFFF").opacity(0.8))
                    .shadow(color: selectedMap == 1 ? Color(hex: "FFFFFF") : Color.white, radius: 8)
                    .frame(width: 280, height: 50)
                    .padding(.horizontal, 20)

                HStack(spacing: 0) {
                    MapButtonView(title: "MY WORLD", mapIndex: 1, selectedMap: $selectedMap)
                    MapButtonView(title: "FRENS WORLD", mapIndex: 2, selectedMap: $selectedMap)
                }
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(hex: "333639").opacity(0.8))
                )
                .clipShape(Capsule(style: .continuous))
                .overlay(
                    Capsule(style: .continuous)
                        .strokeBorder(Color(hex: "202020").opacity(0.8), lineWidth: 4.5)
                )
                .frame(width: 280, height: 60)
            }
        }
        .padding(.top, 230)
        .zIndex(1)
    }
}
