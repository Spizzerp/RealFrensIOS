import SwiftUI

// MARK: - LoginPageView

struct LoginPageView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    // MARK: - Body
    
    var body: some View {
        ZStack {
            // Background rectangles
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 214, height: 43)
                .background(Color(red: 0.62, green: 0.52, blue: 1))
                .cornerRadius(10)
                .offset(x: 0.50, y: 90.50)
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 5
                )
            Rectangle()
                .foregroundColor(.clear)
                .frame(width: 214, height: 43)
                .background(Color(red: 0.62, green: 0.52, blue: 1))
                .cornerRadius(10)
                .offset(x: 0.50, y: -91.50)
                .shadow(
                    color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 5
                )
            
            // Login with Email button
            Button(action: {
                // Add action for "Login with Email"
            }) {
                Text("Login with Email")
                    .font(Font.custom("Switzer Variable", size: 20).weight(.medium))
                    .foregroundColor(.white)
                    .frame(width: 214, height: 43)
                    .background(Color(red: 0.62, green: 0.52, blue: 1))
                    .cornerRadius(10)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 30)
            }
            .offset(x: 0.50, y: -91.50)
            
            // Connect Wallet button
            Button(action: {
                // Add action for "Connect Wallet"
            }) {
                Text("Connect Wallet")
                    .font(Font.custom("Switzer Variable", size: 20).weight(.medium))
                    .foregroundColor(.white)
                    .frame(width: 214, height: 43)
                    .background(Color(red: 0.62, green: 0.52, blue: 1))
                    .cornerRadius(10)
                    .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 30)
            }
            .offset(x: 0, y: 90.50)
            
            // OR text
            Text("OR")
                .font(Font.custom("Switzer Variable", size: 20).weight(.bold))
                .foregroundColor(.white)
                .offset(x: 0, y: 0)
        }
        .frame(width: 393, height: 852)
        .background(
            // Background gradient
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.18, green: 0.18, blue: 0.18), Color(red: 0.09, green: 0.09, blue: 0.09)]), startPoint: .top, endPoint: .bottom)
        )
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "chevron.left")
                        .foregroundColor(.white)
                }
            }
        }
    }
}

// MARK: - Preview

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
