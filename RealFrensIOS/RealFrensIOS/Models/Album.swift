import Foundation

struct Album: Identifiable {
    let id: Int
    let title: String
    let coverImage: String
    let images: [String]
    let date: Date
    let description: String? // Add this property
}
