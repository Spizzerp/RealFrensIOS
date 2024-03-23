import SwiftUI

struct ContentView: View {
    // State variable to track the selected map
    @State private var selectedMap: Int = 1 // 1 for Map1, 2 for Map2

    var body: some View {
        ZStack {
            // Gradient background
            Color.black.edgesIgnoringSafeArea(.all)

            // Gradient overlays
            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.clear]), startPoint: .bottom, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)

            LinearGradient(gradient: Gradient(colors: [Color.purple, Color.clear]), startPoint: .top, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.5)

            VStack { // Main VStack
                Spacer(minLength: 2) // Adjust this value to move Map1Wrapper down

                // Map wrappers with spacer
                VStack(spacing: 0) {
                    if selectedMap == 1 {
                        Map1Wrapper()
                            .frame(height: UIScreen.main.bounds.height * 0.7)
                            .edgesIgnoringSafeArea(.top)
                    } else {
                        Map2Wrapper()
                            .frame(height: UIScreen.main.bounds.height * 0.7)
                            .edgesIgnoringSafeArea(.top)
                    }
                }

                // Button container
                VStack {
                    Spacer(minLength: 0) // Adjust this value to control the spacing
                    VStack {
                        ZStack {
                            // Glow effect layer
                            Capsule(style: .continuous)
                                .fill(Color(hex: "202020")) // Background color for better visibility
                                .shadow(color: selectedMap == 1 ? Color(hex: "007AFF") : Color.purple, radius: 8)
                                .frame(width: 280, height: 60) // Adjust the width and height of the glow effect layer
                                .padding(.horizontal, 20)

                            HStack(spacing: 0) {
                                // Button for "MY WRLD"
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(selectedMap == 1 ? Color(hex: "202020") : Color.clear)
                                        .frame(width: 140, height: 60)

                                    Button(action: { selectedMap = 1 }) {
                                        Text("MY WORLD")
                                            .font(.custom("Inter-Bold", size: 14))
                                            .foregroundColor(.white)
                                            .padding(.vertical, 20)
                                            .frame(maxWidth: .infinity)
                                    }
                                    .frame(width: 140, height: 60)
                                }

                                // Button for "FRENS WRLD"
                                ZStack {
                                    RoundedRectangle(cornerRadius: 30)
                                        .fill(selectedMap == 2 ? Color(hex: "202020") : Color.clear)
                                        .frame(width: 140, height: 60)

                                    Button(action: { selectedMap = 2 }) {
                                        Text("FRENS WORLD")
                                            .font(.custom("Inter-Bold", size: 14))
                                            .foregroundColor(.white)
                                            .padding(.vertical, 20)
                                            .frame(maxWidth: .infinity)
                                    }
                                    .frame(width: 140, height: 60)
                                }
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 0)
                                    .fill(Color(hex: "333639"))
                            )
                            .clipShape(Capsule(style: .continuous))
                            .overlay(
                                Capsule(style: .continuous)
                                    .strokeBorder(Color(hex: "202020"), lineWidth: 5)
                            )
                            .frame(width: 280, height: 60) // Adjust the width and height of the button container
                        }
                    }
                }

                // Future functionalities area
                VStack {
                    // Your future functionalities go here
                    Text("Future functionalities placeholder")
                        .hidden() // Use .hidden() for now, remove or replace it with actual components later
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
            } // End of Main VStack
        }
    }
}

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

// Preview provider for ContentView
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
