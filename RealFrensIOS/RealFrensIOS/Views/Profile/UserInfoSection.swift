import SwiftUI

struct UserInfoSection: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        VStack(spacing: 10) {
            HStack(spacing: 10) {
                Text(viewModel.user?.username ?? "")
                    .font(.custom("Inter", size: 20))
                    .fontWeight(.bold)
                    .foregroundColor(Color(hex: "9F85FF"))

                TipButton()
            }

            Text(viewModel.user?.bio ?? "")
                .font(.custom("Inter", size: 16))
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
    }
}

private struct TipButton: View {
    var body: some View {
        Button(action: {
            // Add the action you want to perform when the button is tapped
        }) {
            HStack {
                Image("Tipicon")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 16, height: 16)
                    .foregroundColor(.white)

                Text("TIP")
                    .font(.custom("Inter", size: 16))
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
            }
            .padding(.vertical, 5)
            .padding(.horizontal, 10)
            .background(Color(hex: "631EE3"))
            .cornerRadius(6)
        }
    }
}
