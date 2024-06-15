import SwiftUI

struct EventRSVPShareAttendeesSection: View {
    var body: some View {
        HStack {
            Button(action: {
                // Handle RSVP action
            }) {
                Text("RSVP")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxHeight: 40)
                    .frame(maxWidth: 100)
                    .background(Color(hex: "631EE3"))
                    .cornerRadius(10)
            }
            .padding(.horizontal)

            Button(action: {
                // Handle share button action
            }) {
                Image(systemName: "square.and.arrow.up")
                    .font(.system(size: 20))
                    .foregroundColor(.white)
            }
            .padding(.horizontal, -10)

            Spacer()

            Button(action: {
                // Handle attendees button action
            }) {
                HStack(spacing: -10) {
                    ForEach(0..<4) { index in
                        Image("pfp\(index + 1)")
                            .resizable()
                            .frame(width: 32, height: 32)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color(hex: "9F85FF"), lineWidth: 1))
                    }

                    Text("+100")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.leading, 15)
                }
            }
            .padding(.trailing, 20)
        }
        .padding(.vertical, 5)
    }
}

// MARK: - Preview Provider
struct EventRSVPShareAttendeesSection_Previews: PreviewProvider {
    static var previews: some View {
        EventRSVPShareAttendeesSection()
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
