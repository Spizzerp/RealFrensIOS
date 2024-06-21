import SwiftUI

// MARK: - Tab Bar View
/// TabBarView is a custom tab bar for navigating between profile, content, notifications, and messaging views.
struct TabBarView: View {
    var onProfileSelected: () -> Void
    var onContentSelected: () -> Void
    var onNotificationsSelected: () -> Void
    var onMessagingSelected: () -> Void

    var body: some View {
        ZStack {
            VStack {
                Spacer()
                Rectangle()
                    .fill(Color(hex: 0x181818))
                    .edgesIgnoringSafeArea(.bottom)
                    .frame(height: 76)
                    .shadow(color: Color.black.opacity(0.5), radius: 15, x: 0, y: -5)
            }
            
            VStack {
                Spacer()
                
                Image("Divider")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(height: 23.5)
                
                HStack {
                    Spacer()
                    
                    Button(action: onProfileSelected) {
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(hex: 0x9F85FF))
                            .shadow(color: Color(hex: 0x9F85FF), radius: 3)
                    }
                    
                    Spacer()
                    
                    Button(action: onContentSelected) {
                        Image(systemName: "circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(hex: 0x9F85FF))
                            .shadow(color: Color(hex: 0x9F85FF), radius: 3)
                    }
                    
                    Spacer()
                    
                    Button(action: onMessagingSelected) {
                        Image(systemName: "message.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(hex: 0x9F85FF))
                            .shadow(color: Color(hex: 0x9F85FF), radius: 3)
                    }
                    
                    Spacer()
                    
                    Button(action: onNotificationsSelected) {
                        Image(systemName: "bell.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 25, height: 25)
                            .foregroundColor(Color(hex: 0x9F85FF))
                            .shadow(color: Color(hex: 0x9F85FF), radius: 3)
                    }
                    
                    Spacer()
                }
                .padding()
                .background(Color(.systemBackground).opacity(0))
                .frame(maxWidth: .infinity)
            }
        }
    }
}

// MARK: - Preview Provider
struct TabBarView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            
            TabBarView(
                onProfileSelected: {
                    print("Profile button tapped")
                },
                onContentSelected: {
                    print("Content button tapped")
                },
                onNotificationsSelected: {
                    print("Notifications button tapped")
                },
                onMessagingSelected: {
                    print("Messaging button tapped")
                }
            )
        }
    }
}
