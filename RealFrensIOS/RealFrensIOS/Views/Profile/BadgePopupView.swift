import SwiftUI

/// A popup view displaying detailed information about a selected badge.
struct BadgePopupView: View {
    @ObservedObject var viewModel: ProfileViewModel

    var body: some View {
        ZStack {
            VStack(alignment: .center, spacing: 10) {
                Text(viewModel.selectedBadgeInfo?.title ?? "")
                    .font(.custom("Inter", size: 18))
                    .fontWeight(.bold)
                    .padding()

                Text(viewModel.selectedBadgeInfo?.description ?? "")
                    .font(.custom("Inter", size: 16))

                Text("Acquired: \(viewModel.selectedBadgeInfo?.dateAcquired ?? "")")
                    .font(.custom("Inter", size: 14))
                    .padding(.bottom)
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)

            VStack {
                HStack {
                    Spacer()
                    Button(action: {
                        viewModel.dismissPopup()
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black)
                            .padding(20)
                    }
                }
                Spacer()
            }
            .frame(width: 300, height: 200)
        }
    }
}
