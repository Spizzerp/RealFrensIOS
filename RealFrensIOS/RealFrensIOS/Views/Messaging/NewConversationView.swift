import SwiftUI

/// A view for starting a new conversation.
struct NewConversationView: View {
    // MARK: - Properties
    
    /// The current search text entered by the user.
    @State private var searchText = ""
    
    /// Environment object to access the presentation mode
    @Environment(\.presentationMode) var presentationMode

    // MARK: - Body
    
    var body: some View {
        ZStack {
            BackgroundGradientView()

            VStack {
                SearchBarView(searchText: $searchText)

                // List of users will go here
                List {
                    // Placeholder for user list
                    Text("User list will appear here")
                }
                .listStyle(PlainListStyle())
            }
        }
        .navigationBarTitle("Start a Convo", displayMode: .inline)
        .navigationBarItems(trailing: Button("Cancel") {
            presentationMode.wrappedValue.dismiss()
        })
        .accentColor(Color(hex: "9F85FF"))
    }
}

// MARK: - Preview
struct NewConversationView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            NewConversationView()
        }
    }
}
