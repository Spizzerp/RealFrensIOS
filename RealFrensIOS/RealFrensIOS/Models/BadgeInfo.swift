import Foundation

struct BadgeInfo: Identifiable {
    let id: UUID
    let title: String
    let description: String
    let dateAcquired: String
    let imageName: String // Add this property for image name

    init(id: UUID = UUID(), title: String, description: String, dateAcquired: String, imageName: String) {
        self.id = id
        self.title = title
        self.description = description
        self.dateAcquired = dateAcquired
        self.imageName = imageName
    }
}
