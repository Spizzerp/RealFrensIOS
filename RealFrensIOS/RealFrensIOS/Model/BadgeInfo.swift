import Foundation

struct BadgeInfo: Identifiable {
    let id: UUID
    let title: String
    let description: String
    let dateAcquired: String

    init(id: UUID = UUID(), title: String, description: String, dateAcquired: String) {
        self.id = id
        self.title = title
        self.description = description
        self.dateAcquired = dateAcquired
    }
}
