import SwiftUI

struct ProfileView: View {
    // Mock data for demonstration
    let mockImages = ["mock1", "mock2", "mock3", "mock4"]
    let mockBadges = ["badge1", "badge2", "badge3", "badge4"]
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all)
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.clear]), startPoint: .bottom, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    profileImageSection
                    statIndicatorSection
                    usernameDescriptionSection
                    customDivider
                    badgeRow
                    // Divider between badges and images
                    customDivider
                    imageRow
                }
                .padding(.top, UIScreen.main.bounds.height * 0.02)
            }
            
            // Positioned the hamburger menu button at the top
            VStack {
                hamburgerMenuButton
                Spacer()
            }
        }
    }
    
    // Profile image with circular overlay and shadow
    var profileImageSection: some View {
        Image("pfp2")
            .resizable()
            .scaledToFill()
            .frame(width: 180, height: 180)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.purple.opacity(0.5), lineWidth: 1))
            .shadow(color: Color.purple.opacity(0.8), radius: 20)
            .padding(.top, 0)
    }
    
    // Horizontal stack for statistics indicators
    var statIndicatorSection: some View {
        HStack(spacing: 35) {
            StatView(count: "120", label: "Frens", countSize: .headline, labelSize: .title3)
            StatView(count: "20", label: "Pins", countSize: .headline, labelSize: .title3)
            StatView(count: "82", label: "Pics", countSize: .headline, labelSize: .title3)
        }
        .padding(.vertical, 20)
    }
    
    // Username and description layout
    var usernameDescriptionSection: some View {
        VStack(alignment: .leading, spacing: 6) {
            Text("@BrokeBoiCapital")
                .font(.title3)
                .fontWeight(.bold)
                .foregroundColor(.purple)
            Text("Hello world, welcome to my first app")
                .font(.body)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(.horizontal)
    }
    
    // Custom divider to separate sections
    var customDivider: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundColor(.white)
            .opacity(0.5)
            .padding(.horizontal)
            .padding(.vertical, 10)
    }
    
    // Row of badges displayed above the images
    var badgeRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 25) {
                ForEach(mockBadges, id: \.self) { badgeName in
                    Image(badgeName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                        .shadow(radius: 3)
                        .padding(.vertical, 5)
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 0)
    }
    
    // Row of images that can be scrolled horizontally
    var imageRow: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 30) {
                ForEach(mockImages, id: \.self) { imageName in
                    Image(imageName)
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 150)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 5)
                        .padding(.vertical, 10)
                }
            }
            .padding(.horizontal)
        }
    }
    
    // Hamburger menu button positioned at the top right
    var hamburgerMenuButton: some View {
        HStack {
            Spacer()
            Button(action: {
                // Action for opening the menu
            }) {
                Image(systemName: "line.horizontal.3")
                    .imageScale(.large)
                    .foregroundColor(.white)
                    .padding()
            }
        }
    }
}

// Helper view for displaying statistic indicators
struct StatView: View {
    let count: String
    let label: String
    var countSize: Font
    var labelSize: Font
    
    var body: some View {
        VStack {
            Text(count)
                .font(countSize)
                .fontWeight(.bold)
                .foregroundColor(.white)
            Text(label)
                .font(labelSize)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

// Preview provider for SwiftUI canvas
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
