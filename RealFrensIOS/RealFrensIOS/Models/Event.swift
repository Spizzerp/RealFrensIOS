import Foundation

struct Event: Identifiable {
    let id: Int
    let title: String
    let location: String
    let time: String
    let date: Date
    let images: [String]
}
