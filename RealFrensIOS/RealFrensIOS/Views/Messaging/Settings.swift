import SwiftUI

/// A view that displays the app settings.
struct SettingsView: View {
    // MARK: - Properties
    
    /// Environment variable to dismiss the view
    @Environment(\.presentationMode) var presentationMode

    // MARK: - Body
    
    var body: some View {
        NavigationView {
            List {
                // Placeholder for actual settings
                Text("Settings will go here")
            }
            .navigationBarTitle("Settings", displayMode: .inline)
            .navigationBarItems(trailing: Button("Done") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

// MARK: - Preview

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
