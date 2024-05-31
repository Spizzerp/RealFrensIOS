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
    @State private var currentEventIndex: Int = 0 // State variable to track the current event index

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

                Spacer() // Add a spacer to push the future functionalities area down

                // Future functionalities area
                futureFunctionalitiesView()
            } // End of Main VStack

            // New layer at the bottom
            VStack {
                Spacer()
                newLayerView()
            }

            // Event alerts section
            VStack {
                Spacer()
                eventAlertsView()
            }
            .padding(.bottom, 65) // Adjust the bottom padding to move the events section up

            // Button container should be at the very front
            buttonContainerView()
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
        .padding(.top, 230) // Add padding to create space between the map wrapper and the button container
        .zIndex(1) // Ensure the button container is visible above the new layer
    }

    // MARK: - Map Button / Selection
    @ViewBuilder
    func mapButtonView(title: String, mapIndex: Int) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .fill(selectedMap == mapIndex ? Color(hex: "202020").opacity(0.8) : Color.clear) // Change the opacity of the selected button background
                .frame(width: 140, height: 50)

            Button(action: {
                selectedMap = mapIndex
                if selectedMap == 2 {
                    NotificationCenter.default.post(name: .eventSelected, object: nil)
                }
            }) {
                Text(title)
                    .font(.custom("Inter-Bold", size: 14))
                    .foregroundColor(.white.opacity(0.8)) // Change the opacity of the button text
                    .padding(.vertical, 20)
                    .frame(maxWidth: .infinity)
            }
            .frame(width: 140, height: 50)
        }
        .zIndex(1) // Ensure the button container is visible above the new layer
    }

    // MARK: - New Layer View
    @ViewBuilder
    func newLayerView() -> some View {
        Rectangle()
            .foregroundColor(.clear)
            .frame(width: 393, height: 500)
            .background(
                LinearGradient(
                    stops: [
                        Gradient.Stop(color: Color(red: 0.24, green: 0.24, blue: 0.24), location: 0.00),
                        Gradient.Stop(color: Color(red: 0.12, green: 0.12, blue: 0.12), location: 0.85),
                    ],
                    startPoint: UnitPoint(x: 0.5, y: -0.01),
                    endPoint: UnitPoint(x: 0.5, y: 1)
                )
            )
            .cornerRadius(54)
            .shadow(color: .black.opacity(0.35), radius: 50.15, x: 0, y: -21)
            .overlay(
                RoundedRectangle(cornerRadius: 54)
                    .inset(by: 0.5)
                    .stroke(.black, lineWidth: 0.5)
            )
            .offset(y: 171.5) // Adjust the offset to position the layer at the bottom
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

    // MARK: - Event Alerts View
    @ViewBuilder
    func eventAlertsView() -> some View {
        VStack {
            Rectangle()
                .foregroundColor(Color(hex: "191919"))
                .frame(height: 130)
                .overlay(
                    VStack {
                        Image("Divider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 10)
                            .padding(.bottom, 0)

                        Text("Event Alerts")
                            .font(Font.custom("Switzer Variable", size: 12).weight(.medium))
                            .tracking(2.35)
                            .foregroundColor(.white)

                        Image("Divider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 10)

                        ZStack {
                            TabView(selection: $currentEventIndex) {
                                eventItemView(imageName: "Pinbonk", eventText: "Bonk! Event Near You")
                                    .tag(0)
                                eventItemView(imageName: "Pinsol", eventText: "Solana BreakPoint SOON")
                                    .tag(1)
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(height: 100)

                            VStack {
                                Spacer()
                                eventIndicatorView()
                                    .padding(.bottom, 25)
                            }
                        }
                    }
                )
        }
    }

    // MARK: - Event Item View
    @ViewBuilder
    func eventItemView(imageName: String, eventText: String) -> some View {
        HStack {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 44.35, height: 44.35)

            Text(eventText)
                .font(Font.custom("Switzer Variable", size: 20).weight(.medium))
                .foregroundColor(.white)
        }
        .frame(maxWidth: .infinity) // Make the HStack fill the available width
        .padding(.horizontal) // Add horizontal padding to the HStack
        .padding(.bottom, 30)
        .onTapGesture {
            // Send notification to bring up event on the map
            NotificationCenter.default.post(name: .eventSelected, object: imageName)
            print("Clicked on event item: \(eventText)")

            // If currently in "My World" view, switch to "Frens World" view and trigger event selection
            if selectedMap == 1 {
                selectedMap = 2
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                    NotificationCenter.default.post(name: .eventSelected, object: imageName)
                }
            }
        }
    }

    // MARK: - Event Indicator View
    @ViewBuilder
    func eventIndicatorView() -> some View {
        HStack(spacing: 8) {
            ForEach(0..<2) { index in
                Circle()
                    .frame(width: 5, height: 5)
                    .foregroundColor(index == currentEventIndex ? Color(hex: "9E85FF") : Color(hex: "D9D9D9").opacity(0.29))
            }
        }
    }
}

// Preview provider for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

extension Notification.Name {
    static let eventSelected = Notification.Name("eventSelected")
}
