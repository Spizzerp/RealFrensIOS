import Foundation

struct Pin {
    var emoji: String
    var title: String
    var location: String
}

// Static property for sample pins
extension Pin {
    static let samplePins = [
        Pin(emoji: "🏖️", title: "Beach Day", location: "Sunny Shores"),
        Pin(emoji: "🏔️", title: "Mountain Hike", location: "Rocky Peaks"),
        Pin(emoji: "🏰", title: "Historical Tour", location: "Old Castle"),
        Pin(emoji: "🌆", title: "City Exploration", location: "Downtown"),
        Pin(emoji: "🎢", title: "Amusement Park", location: "Thrill Land"),
        Pin(emoji: "🍇", title: "Winery Visit", location: "Vineyard Valley"),
        Pin(emoji: "🎨", title: "Art Museum", location: "Gallery Row"),
        Pin(emoji: "🛍️", title: "Shopping Spree", location: "Market Street"),
        Pin(emoji: "🍽️", title: "Food Festival", location: "Taste Town")
    ]
}
