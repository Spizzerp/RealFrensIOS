import SwiftUI

struct StatView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    var body: some View {
        HStack(spacing: 35) {
            StatItem(count: "\(viewModel.frensCount)", label: "Frens")
            StatItem(count: "\(viewModel.pinsCount)", label: "Pins")
            StatItem(count: "\(viewModel.level)", label: "Level")
        }
        .padding(.vertical, 15)
    }
}

private struct StatItem: View {
    let count: String
    let label: String
    
    var body: some View {
        VStack {
            Text(count)
                .font(.custom("Inter", size: 24))
                .fontWeight(.bold)
                .foregroundColor(Color(hex: "9F85FF"))
            Text(label)
                .font(.custom("Inter", size: 16))
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}
