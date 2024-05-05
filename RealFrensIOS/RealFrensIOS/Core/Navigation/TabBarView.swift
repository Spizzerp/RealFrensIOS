import SwiftUI

struct TabBarView: View {
    // Callbacks for when buttons are tapped
    var onProfileSelected: () -> Void
    var onContentSelected: () -> Void
    
    var body: some View {
        VStack {
            Spacer()
                .frame(height: 400) // Adjust the height as needed
            
            HStack {
                Spacer()
                
                // Profile Button with Icon
                Button(action: onProfileSelected) {
                    Image(systemName: "person.fill")
                        .imageScale(.large)
                        .foregroundColor(.white) // icon color
                        .shadow(color: .white, radius: 3) // White glow effect
                }
                
                Spacer()
                
                // Content Button with Icon
                Button(action: onContentSelected) {
                    Image(systemName: "circle.fill")
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
}
