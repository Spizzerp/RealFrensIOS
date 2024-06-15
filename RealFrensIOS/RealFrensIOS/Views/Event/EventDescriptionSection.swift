import SwiftUI

struct EventDescriptionSection: View {
    let description: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(description)
                .font(.caption)
                .foregroundColor(.white)
                .padding(.vertical, 5)
                .fixedSize(horizontal: false, vertical: true)
                .frame(minWidth: 320, maxWidth: 320, alignment: .leading)
        }
        .padding()
        .background(Color(hex: "131313"))
        .cornerRadius(10)
        .padding(.horizontal)
        .padding(.vertical, 1)
        .fixedSize(horizontal: true, vertical: false)
    }
}

// MARK: - Preview Provider
struct EventDescriptionSection_Previews: PreviewProvider {
    static var previews: some View {
        EventDescriptionSection(description: "Join us for an evening of fun and festivities. We're bringing Web3 to reality. All are welcome and we've got some special prizes for attendees. LFG!")
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
