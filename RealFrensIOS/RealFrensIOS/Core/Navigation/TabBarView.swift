import SwiftUI

struct TabBarView: View {
    // Callbacks for when buttons are tapped
    var onProfileSelected: () -> Void
    var onContentSelected: () -> Void
    
    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color(hex: "181818"))
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(height: 76)
                    .shadow(color: Color.black.opacity(0.5), radius: 15, x: 0, y: -5) // Add shadow
            }
            
            VStack {
                Spacer() // Add a Spacer to push the divider and buttons down
                
                Image("Divider")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 23.5) // Adjust the height of the divider as needed
                
                HStack {
                    Spacer()
                    
                    // Profile Button with Icon
                    Button(action: onProfileSelected) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25) // Adjust the size of the icon
                            .foregroundColor(Color(hex: "9F85FF")) // Set the icon color
                            .shadow(color: Color(hex: "9F85FF"), radius: 3) // Shadow color matches the icon color
                    }
                    
                    Spacer()
                    
                    // Content Button with Icon
                    Button(action: onContentSelected) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25) // Adjust the size of the icon
                            .foregroundColor(Color(hex: "9F85FF")) // Set the icon color
                            .shadow(color: Color(hex: "9F85FF"), radius: 3) // Shadow color matches the icon color
                    }
                    
                    Spacer()
                    
                    // Notifications Button with Icon
                    Button(action: {
                        // Action for Notifications
                    }) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25) // Adjust the size of the icon
                            .foregroundColor(Color(hex: "9F85FF")) // Set the icon color
                            .shadow(color: Color(hex: "9F85FF"), radius: 3) // Shadow color matches the icon color
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemBackground).opacity(0)) // Transparent background
                .frame(maxWidth: .infinity)
            }
        }
    }
}

struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
                .edgesIgnoringSafeArea(.all)
            
            TabBarView(
                onProfileSelected: {
                    // Placeholder action for profile button
                    print("Profile button tapped")
                },
                onContentSelected: {
                    // Placeholder action for content button
                    print("Content button tapped")
                }
            )
        }
    }
}
