import SwiftUI

struct ProfileView: View {
    var body: some View {
        ZStack {
            // Set the entire background to black
            Color.black.edgesIgnoringSafeArea(.all)

            // Apply gradient from top to center
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.clear]), startPoint: .bottom, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.6)

            // Profile content
            VStack {
                // Top Section
                topSection
                
                // Divider
                customDivider

                // Middle Section - Scrollable Pins View
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 30) {
                        ForEach(Pin.samplePins, id: \.title) { pin in
                            pinRow(for: pin)
                        }
                    }
                    .padding(.horizontal)
                }
                
                
                // Divider
                customDivider
                
                Spacer(minLength: 70)

            }
        }
    }
    var topSection: some View {
        VStack {
            // Pic and stats
            HStack {
                Image("pfp1")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .padding(.leading)

                Spacer() // Spacer to push content towards center

                // Frens, Pins, and Posts stats in their own HStack
                HStack(spacing: 20) { // Adjust the spacing between stats
                    StatView(count: "8", label: "Frens")
                    StatView(count: "8", label: "Pins")
                    StatView(count: "8", label: "Pics")
                }

                Spacer() // Spacer to balance the layout
            }

            // Name and bio
            VStack(alignment: .leading, spacing: 4) {
                Text("@BrokeBoiCapital")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                Text("Hello world, welcome to my first app")
                    .font(.footnote)
                    .foregroundColor(.white)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.horizontal)

            // Edit Profile button
            Button { } label: {
                Text("Edit Profile")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .frame(width: 360, height: 32)
                    .background(Color.gray)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.25), lineWidth: 5))
            }
        }
    }
    
    var customDivider: some View {
        Rectangle()
            .frame(height: 1)
            .foregroundColor(.white)
            .padding(.horizontal)
            .padding(.vertical, 10)
    }

    func pinRow(for pin: Pin) -> some View {
        HStack {
            Text(pin.emoji)
                .font(.largeTitle)
            VStack(alignment: .leading) {
                Text(pin.title)
                    .font(.headline)
                    .foregroundColor(.white)
                Text(pin.location)
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
        }
        .padding(.vertical, 5)
    }
}

struct StatView: View {
    var count: String
    var label: String
    
    var body: some View {
        VStack {
            Text(count)
                .font(.subheadline)
                .fontWeight(.semibold)
                .foregroundColor(.white)
            Text(label)
                .font(.footnote)
                .foregroundColor(.white)
        }
        .frame(width: 60)
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
