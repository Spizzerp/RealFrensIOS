import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    
    var body: some View {
        TextField("Search", text: $searchText)
            .padding(.horizontal, 10)
            .frame(width: 200, height: 32)
            .background(Color.gray.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(16)
            .customFont(size: 14, weight: .bold)
            .accentColor(.white)
    }
}
