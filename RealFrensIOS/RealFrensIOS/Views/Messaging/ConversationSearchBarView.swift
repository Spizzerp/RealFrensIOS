import SwiftUI

/// A custom search bar view specifically for searching conversations.
struct ConversationSearchBarView: View {
    /// Binding to the search text.
    @Binding var searchText: String

    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
                .foregroundColor(.gray)
            
            TextField("Search conversations", text: $searchText)
                .font(.custom("Inter", size: 16))
        }
        .padding()
        .background(Color.gray.opacity(0.2))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.top)
    }
}
