import SwiftUI

struct EventTitleSection: View {
    let event: Event
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Event Details")
                    .font(.headline)
                    .foregroundColor(Color(red: 0.62, green: 0.52, blue: 1))
                
                Text(event.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("\(event.location). \(event.time), \(formattedDate)")
                    .font(.subheadline)
                    .foregroundColor(Color.gray)
            }
            
            Spacer()
            
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Image(systemName: "xmark")
                    .foregroundColor(.white)
                    .padding()
            }
        }
        .padding()
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
        return dateFormatter.string(from: event.date)
    }
}

// MARK: - Preview Provider
struct EventTitleSection_Previews: PreviewProvider {
    static var previews: some View {
        EventTitleSection(event: Event(id: 1, title: "Breakpoint", location: "SGP", time: "6:00 PM", date: Date(), images: []))
            .background(Color.black.edgesIgnoringSafeArea(.all))
    }
}
