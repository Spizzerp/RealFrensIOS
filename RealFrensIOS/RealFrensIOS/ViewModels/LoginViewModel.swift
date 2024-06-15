import SwiftUI
import Combine

class LoginViewModel: ObservableObject {
    @Published var showButtons: Bool = false
    
    // Any additional properties or functions can be added here
    
    init() {
        // Initialize any required properties or perform setup here
    }
    
    func triggerButtonAnimation() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            withAnimation {
                self.showButtons = true
            }
        }
    }
}
