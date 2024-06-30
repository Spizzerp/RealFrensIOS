import SwiftUI

/// A custom search bar view specifically for searching conversations.
struct ConversationSearchBarView: View {
    /// Binding to the search text.
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
                .font(.system(size: 14))
            
            TextField("Search conversations", text: $searchText)
                .font(.system(size: 14))
                .foregroundColor(.white)
                .accentColor(.white)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .placeholder(when: searchText.isEmpty) {
                    Text("Search conversations")
                        .foregroundColor(.white.opacity(0.6))
                        .font(.system(size: 14))
                }
            
            if !searchText.isEmpty {
                Button(action: {
                    searchText = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                }
            }
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(hex: "2C2C2E"))
        .cornerRadius(10)
        .padding(.horizontal, 16)
        .padding(.bottom, 1)
    }
}

// MARK: - Placeholder View Modifier
extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}

