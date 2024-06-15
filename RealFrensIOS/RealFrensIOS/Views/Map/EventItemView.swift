import SwiftUI

struct EventItemView: View {
    let imageName: String
    let eventText: String
    @Binding var selectedMap: Int
    
    var body: some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44.35, height: 44.35)

            Text(eventText)
                .customFont(size: 20, weight: .medium)
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal)
        .padding(.bottom, 30)
        .onTapGesture {
            NotificationCenter.default.post(name: .eventSelected, object: imageName)
            print("Clicked on event item: \(eventText)")

            if selectedMap == 1 {
                selectedMap = 2
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    NotificationCenter.default.post(name: .eventSelected, object: imageName)
                }
            }
        }
    }
}
