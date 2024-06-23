import SwiftUI

/// A view for starting a new conversation.
struct NewConversationView: View {
    // MARK: - Properties
    
    /// The current search text entered by the user.
    @State private var searchText = ""
    
    /// The presentation mode used to dismiss the view.
    @Environment(\.presentationMode) var presentationMode

    // MARK: - Body
    
    var body: some View {
        NavigationView {
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
        }
        .accentColor(Color(hex: "9F85FF"))
    }
}
