import SwiftUI

/// A button that displays a menu with various options.
struct HamburgerMenuButton: View {
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Menu {
                    Button(action: {}) {
                        Label("Settings", systemImage: "gear")
                    }
                    Button(action: {}) {
                        Label("QR Code", systemImage: "qrcode.viewfinder")
                    }
                    Button(action: {}) {
                        Label("Insights", systemImage: "chart.bar")
                    }
                    Button(action: {}) {
                        Label("Wallet", systemImage: "creditcard")
                    }
                } label: {
                    Image(systemName: "line.horizontal.3")
                        .imageScale(.large)
                        .foregroundColor(.white)
                        .padding()
                }
            }
            Spacer()
        }
    }
}
