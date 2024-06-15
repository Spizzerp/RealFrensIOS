import SwiftUI

// MARK: - Stat View Component
/// StatView displays a count and label for a profile stat.
struct StatView: View {
    let count: String
    let label: String
    let countColor: Color
    
    var body: some View {
        VStack {
            Text(count)
                .customFont(size: 24, weight: .bold) // Use the custom font modifier
                .foregroundColor(countColor)
            Text(label)
                .customFont(size: 16, weight: .semibold) // Use the custom font modifier
                .foregroundColor(.white)
        }
    }
}

// MARK: - Preview Provider
struct StatView_Previews: PreviewProvider {
    static var previews: some View {
        StatView(count: "120", label: "Frens", countColor: Color(hex: "9F85FF"))
            .background(Color.black)
            .previewLayout(.sizeThatFits)
    }
}
