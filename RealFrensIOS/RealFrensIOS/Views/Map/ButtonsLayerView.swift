import SwiftUI

struct ButtonsLayerView: View {
    var body: some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 393, height: 500)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.24, green: 0.24, blue: 0.24), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.12, green: 0.12, blue: 0.12), location: 0.85),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: -0.01),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
            .cornerRadius(54)
            .shadow(color: .black.opacity(0.35), radius: 50.15, x: 0, y: -21)
            .overlay(
                RoundedRectangle(cornerRadius: 54)
                    .inset(by: 0.5)
                    .stroke(.black, lineWidth: 0.5)
            )
            .offset(y: 171.5)
    }
}
