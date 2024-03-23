import SwiftUI

// Badge data model
struct BadgeInfo {
    let title: String
    let description: String
    let dateAcquired: String
}

struct ProfileView: View {
    let mockImages = ["mock1", "mock2", "mock3", "mock4"]
    let mockBadges = ["badge1", "badge2", "badge3", "badge4"]
    
    // Sample data for badge popups
    let badgeDetails = [
        "badge1": BadgeInfo(title: "Badge 1", description: "This is badge 1", dateAcquired: "01/01/2021"),
        "badge2": BadgeInfo(title: "Badge 2", description: "This is badge 2", dateAcquired: "02/02/2021"),
        "badge3": BadgeInfo(title: "Badge 3", description: "This is badge 3", dateAcquired: "03/03/2021"),
        "badge4": BadgeInfo(title: "Badge 4", description: "This is badge 4", dateAcquired: "04/04/2021")
    ]
    
    @State private var showingPopup = false
    @State private var selectedBadgeInfo = BadgeInfo(title: "", description: "", dateAcquired: "")
    
    var body: some View {
        ZStack {
            // Gradient background
            Color.black.edgesIgnoringSafeArea(.all)
            
            // Gradient from bottom to center
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.clear]), startPoint: .bottom, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)
            
            // Gradient from top to center (New addition)
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.clear]), startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)

            // Main content
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    profileImageSection
                    statIndicatorSection
                    usernameDescriptionSection
                    customDivider
                    badgeRow
                    customDivider // Divider between badges and images
                    imageRow
                }
                .padding(.top, UIScreen.main.bounds.height * 0.02)
            }

            // Hamburger menu button - Positioned at the top
            VStack {
                HStack {
                    Spacer()
                    Menu {
                        Button(action: {
                            // Action for Settings
                        }) {
                            Label("Settings", systemImage: "gear")
                        }
                        Button(action: {
                            // Action for QR Code
                        }) {
                            Label("QR Code", systemImage: "qrcode.viewfinder")
                        }
                        Button(action: {
                            // Action for Insights
                        }) {
                            Label("Insights", systemImage: "chart.bar")
                        }
                    } label: {
                        Image(systemName: "line.horizontal.3")
                            .imageScale(.large)
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                Spacer() // Pushes the hamburger menu to the top
            }

            // Popup for badge details
            if showingPopup {
                popupView
            }
        }
    }
    
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
    
    var statIndicatorSection: some View {
        HStack(spacing: 35) {
            StatView(count: "120", label: "Frens", countSize: .headline, labelSize: .title3)
            StatView(count: "20", label: "Pins", countSize: .headline, labelSize: .title3)
            StatView(count: "82", label: "Pics", countSize: .headline, labelSize: .title3)
        }
        .padding(.vertical, 25)
    }
    
    var usernameDescriptionSection: some View {
        VStack(alignment: .leading, spacing: 10) {
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
    
    var customDivider: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.white)
            .opacity(0.5)
            .padding(.horizontal)
            .padding(.vertical, 10)
    }
    
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
                        .onTapGesture {
                            self.selectedBadgeInfo = self.badgeDetails[badgeName] ?? BadgeInfo(title: "Unknown", description: "No description", dateAcquired: "N/A")
                            self.showingPopup = true
                        }
                }
            }
            .padding(.horizontal)
        }
        .padding(.bottom, 0)
    }
    
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
    
    var popupView: some View {
        ZStack {
            // Popup background and content
            VStack(alignment: .center, spacing: 10) {
                Text(selectedBadgeInfo.title)
                    .font(.headline)
                    .padding()
                Text(selectedBadgeInfo.description)
                    .font(.body)
                Text("Acquired: \(selectedBadgeInfo.dateAcquired)")
                    .font(.footnote)
                    .padding(.bottom)
            }
            .frame(width: 300, height: 200)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 10)
            
            // Close button
            VStack {
                HStack {
                    Spacer() // Pushes the button to the right
                    Button(action: {
                        self.showingPopup = false
                    }) {
                        Image(systemName: "xmark")
                            .foregroundColor(.black) // Color of the X button
                            .padding(20) // Size of the clickable area
                    }
                }
                Spacer() // Pushes the content to the top
            }
            .frame(width: 300, height: 200) // Ensures the button's frame matches the popup's frame
        }
    }
}

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

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
