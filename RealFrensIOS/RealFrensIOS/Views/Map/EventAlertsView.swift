import SwiftUI

struct EventAlertsView: View {
    @Binding var currentEventIndex: Int
    @Binding var selectedMap: Int
    
    var body: some View {
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
                            .customFont(size: 12, weight: .medium)
                            .tracking(2.35)
                            .foregroundColor(.white)

                        Image("Divider")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(height: 10)

                        ZStack {
                            TabView(selection: $currentEventIndex) {
                                EventItemView(imageName: "Pinbonk", eventText: "Bonk! Event Near You", selectedMap: $selectedMap)
                                    .tag(0)
                                EventItemView(imageName: "Pinsol", eventText: "Solana BreakPoint SOON", selectedMap: $selectedMap)
                                    .tag(1)
                            }
                            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                            .frame(height: 100)

                            VStack {
                                Spacer()
                                EventIndicatorView(currentEventIndex: $currentEventIndex)
                                    .padding(.bottom, 25)
                            }
                        }
                    }
                )
        }
    }
}
