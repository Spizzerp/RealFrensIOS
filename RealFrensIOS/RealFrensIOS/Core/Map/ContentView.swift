import SwiftUI

// Extension to initialize Color from a hex string
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        var rgbValue: UInt64 = 0
        scanner.scanHexInt64(&rgbValue)

        let r = (rgbValue & 0xff0000) >> 16
        let g = (rgbValue & 0xff00) >> 8
        let b = rgbValue & 0xff

        self.init(
            red: Double(r) / 0xff,
            green: Double(g) / 0xff,
            blue: Double(b) / 0xff
        )
    }
}

struct ContentView: View {
    // State variables
    @State private var selectedMap: Int = 1 // 1 for Map1, 2 for Map2
    @State private var searchText: String = "" // State variable for search text
    @State private var isSearchBarVisible: Bool = false // State variable to track search bar visibility

    var body: some View {
        ZStack {
            // Background
            Color.black.edgesIgnoringSafeArea(.all)

            // Gradient overlays
            LinearGradient(gradient: Gradient(colors: [Color.gray, Color.clear]), startPoint: .bottom, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)

            VStack { // Main VStack
                // Map wrappers
                mapWrapperView()

                Spacer() // Add a spacer to create distance between the map wrapper and the button container

                // Button container
                buttonContainerView()

                Spacer() // Add a spacer to push the future functionalities area down

                // Future functionalities area
                futureFunctionalitiesView()
            } // End of Main VStack
        }
    }

    // MARK: - Map Wrapper View
    @ViewBuilder
    func mapWrapperView() -> some View {
        ZStack {
            // Display selected map
            if selectedMap == 1 {
                Map1Wrapper()
                    .ignoresSafeArea()
            } else {
                Map2Wrapper()
                    .ignoresSafeArea()
            }

            // Search button, search bar, and add pin button
            VStack {
                HStack {
                    ZStack {
                        HStack(spacing: 10) {
                            searchButtonView()

                            if isSearchBarVisible {
                                searchBarView()
                            }
                        }
                    }

                    Spacer()

                    // Add Pin button
                    addPinButtonView()
                }
                .padding(.horizontal, 30)
                .padding(.top, 15)

                Spacer()
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.60) // Adjust the height of the map window
    }

    // MARK: - Search Bar View
    @ViewBuilder
    func searchBarView() -> some View {
        TextField("Search", text: $searchText)
            .padding(.horizontal, 10)
            .frame(width: 200, height: 32)
            .background(Color.gray.opacity(0.8))
            .foregroundColor(.white)
            .cornerRadius(16)
            .font(.custom("Inter-Bold", size: 14))
            .foregroundColor(.white)
            .accentColor(.white)
    }

    // MARK: - Search Button View
    @ViewBuilder
    func searchButtonView() -> some View {
        Button(action: {
            withAnimation {
                isSearchBarVisible.toggle()
            }
        }) {
            Image(systemName: "magnifyingglass")
                .imageScale(.large)
                .foregroundColor(.white)
                .padding(10)
                .background(
                    Circle()
                        .fill(Color.black.opacity(0.5))
                )
                .shadow(color: .white, radius: 1)
        }
    }

    // MARK: - Add Pin Button View
    @ViewBuilder
    func addPinButtonView() -> some View {
        Button(action: {
            // Handle add pin action
        }) {
            Image(systemName: "pin.fill")
                .imageScale(.large)
                .foregroundColor(.white)
                .padding(10)
                .background(
                    Circle()
                        .fill(Color.black.opacity(0.5))
                )
                .shadow(color: .white, radius: 1)
        }
    }

    // MARK: - Map Button / Selection Container View
    @ViewBuilder
    func buttonContainerView() -> some View {
        VStack {
            ZStack {
                // Glow effect layer
                Capsule(style: .continuous)
                    .fill(Color(hex: "FFFFFF").opacity(0.8)) // Change the opacity of the background color
                    .shadow(color: selectedMap == 1 ? Color(hex: "FFFFFF") : Color.white, radius: 8)
                    .frame(width: 280, height: 50) // Adjust the width and height of the glow effect layer
                    .padding(.horizontal, 20)

                HStack(spacing: 0) {
                    // Button for "MY WRLD"
                    mapButtonView(title: "MY WORLD", mapIndex: 1)

                    // Button for "FRENS WRLD"
                    mapButtonView(title: "FRENS WORLD", mapIndex: 2)
                }
                .background(
                    RoundedRectangle(cornerRadius: 0)
                        .fill(Color(hex: "333639").opacity(0.8)) // Change the opacity of the button container background
                )
                .clipShape(Capsule(style: .continuous))
                .overlay(
                    Capsule(style: .continuous)
                        .strokeBorder(Color(hex: "202020").opacity(0.8), lineWidth: 4.5) // Change the opacity of the button container border
                )
                .frame(width: 280, height: 60) // Adjust the width and height of the button container
            }
        }
        .padding(.top, 50) // Add padding to create space between the map wrapper and the button container
    }

    // MARK: - Map Button / Selection
    @ViewBuilder
    func mapButtonView(title: String, mapIndex: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(selectedMap == mapIndex ? Color(hex: "202020").opacity(0.8) : Color.clear) // Change the opacity of the selected button background
                .frame(width: 140, height: 50)

            Button(action: { selectedMap = mapIndex }) {
                Text(title)
                    .font(.custom("Inter-Bold", size: 14))
                    .foregroundColor(.white.opacity(0.8)) // Change the opacity of the button text
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
            }
            .frame(width: 140, height: 50)
        }
    }

    // MARK: - Future Functionalities View
    @ViewBuilder
    func futureFunctionalitiesView() -> some View {
        VStack {
            // Your future functionalities go here
            Text("Future functionalities placeholder")
                .hidden() // Use .hidden() for now, remove or replace it with actual components later
        }
        .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

// Preview provider for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
