import SwiftUI

struct SearchButtonView: View {
    @Binding var isSearchBarVisible: Bool
    
    var body: some View {
        Button(action: {
            withAnimation {
                isSearchBarVisible.toggle()
            }
        }) {
            Image(systemName: "magnifyingglass")
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
