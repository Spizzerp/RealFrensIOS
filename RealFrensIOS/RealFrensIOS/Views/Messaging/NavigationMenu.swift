import SwiftUI

/// A view that provides a menu for navigation and additional options in the messaging view.
struct NavigationMenuView: View {
    // MARK: - Properties
    
    /// Binding to control the presentation of the settings view.
    @Binding var showingSettings: Bool

    // MARK: - Body
    
    var body: some View {
        Menu {
            // Option for viewing archived chats
            Button(action: {
                // TODO: Implement action for viewing archived chats
            }) {
                Label("Archived chats", systemImage: "archivebox")
            }
            
            // Option for creating a new group
            Button(action: {
                // TODO: Implement action for creating a new group
            }) {
                Label("New group", systemImage: "person.3")
            }
            
            // Option for accessing settings
            Button(action: {
                showingSettings = true
            }) {
                Label("Settings", systemImage: "gear")
            }
        } label: {
            // Menu icon (three horizontal lines)
            Image(systemName: "line.horizontal.3")
                .imageScale(.large)
                .foregroundColor(.white)
                .padding()
        }
    }
}

// MARK: - Preview

struct NavigationMenuView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a constant binding for preview purposes
        NavigationMenuView(showingSettings: .constant(false))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.gray) // Add a background color to make the white icon visible
    }
}
