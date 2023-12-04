import SwiftUI

struct TabBarView: View {
    var body: some View {
        HStack {
            Spacer()

            // Profile Button with Icon
            Button(action: {
                // Action for Profile
            }) {
                Image(systemName: "person.fill")
                    .imageScale(.large)
                    .foregroundColor(.white) // icon color
                    .shadow(color: .white, radius: 3) // White glow effect
            }

            Spacer()

            // Add Pin Button with Icon
            Button(action: {
                NotificationCenter.default.post(name: .addPin, object: nil)
            }) {
                Image(systemName: "pin.fill")
                    .imageScale(.large)
                    .foregroundColor(.white) // icon color
                    .shadow(color: .white, radius: 3) // White glow effect
            }

            Spacer()

            // Notifications Button with Icon
            Button(action: {
                // Action for Notifications
            }) {
                Image(systemName: "bell.fill")
                    .imageScale(.large)
                    .foregroundColor(.white) // icon color
                    .shadow(color: .white, radius: 3) // White glow effect
            }

            Spacer()
        }
        .padding()
        .background(Color(.systemBackground).opacity(0)) // Transparent background
        .frame(maxWidth: .infinity)
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        TabBarView()
    }
}
