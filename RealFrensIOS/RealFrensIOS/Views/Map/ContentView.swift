import SwiftUI

// MARK: - Content View
/// ContentView is the main view displaying the map and various interactive elements.
struct ContentView: View {
    @StateObject private var viewModel = ContentViewModel()
    
    // MARK: - Body
    var body: some View {
        ZStack {
            CustomGradientBackground()
            
            VStack {
                MapWrapperView(selectedMap: $viewModel.selectedMap, isSearchBarVisible: $viewModel.isSearchBarVisible, searchText: $viewModel.searchText)
                Spacer()
            }

            VStack {
                Spacer()
                ButtonsLayerView()
            }

            VStack {
                Spacer()
                EventAlertsView(currentEventIndex: $viewModel.currentEventIndex, selectedMap: $viewModel.selectedMap)
            }
            .padding(.bottom, 65)

            ButtonContainerView(selectedMap: $viewModel.selectedMap)
        }
    }
}

// MARK: - Preview Provider
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
