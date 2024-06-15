import SwiftUI
import Combine

class ContentViewModel: ObservableObject {
    @Published var selectedMap: Int = 1 // 1 for Map1, 2 for Map2
    @Published var searchText: String = "" // State variable for search text
    @Published var isSearchBarVisible: Bool = false // State variable to track search bar visibility
    @Published var currentEventIndex: Int = 0 // State variable to track the current event index

    // Toggle the visibility of the search bar
    func toggleSearchBar() {
        isSearchBarVisible.toggle()
    }

    // Select a map to display
    func selectMap(mapIndex: Int) {
        selectedMap = mapIndex
        if selectedMap == 2 {
            NotificationCenter.default.post(name: .eventSelected, object: nil)
        }
    }

    // Handle event selection
    func selectEvent(imageName: String, eventText: String) {
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
