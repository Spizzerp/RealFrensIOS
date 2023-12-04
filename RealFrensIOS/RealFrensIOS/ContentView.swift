import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Map1Wrapper() // Map1 as the primary content

            VStack {
                Spacer() // Pushes the content to the bottom
                TabBarView() // Custom Tab Bar
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
