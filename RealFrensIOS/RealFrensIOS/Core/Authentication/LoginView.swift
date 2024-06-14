import SwiftUI

struct LoginView: View {
    @State private var showButtons = false
    
    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                // Entire screen's background color
                Color.black.edgesIgnoringSafeArea(.all)
                
                // Adjusted Gradient overlay
                LinearGradient(gradient: Gradient(colors: [Color.white, Color.black]), startPoint: .top, endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.3) // Adjust opacity for blending effect
                
                // Globe background image at the bottom
                Image("GlobeWBalls")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250) // Adjust the height as needed
                    .edgesIgnoringSafeArea(.all)
                
                // Center section with Logo and text
                VStack {
                    VStack(spacing: -30) {
                        Image("Logo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100)
                            .padding(.bottom, 20)
                        
                        Image("TextLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 150)
                        
                        Text("THE WORLD IS Y")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(.white) +
                        Text("OURS")
                            .font(.system(size: 16, weight: .semibold))
                            .foregroundColor(Color(hex: "9F85FF"))
                    }
                    .padding(.top, 160)
                    
                    // Navigation section for logging in
                    HStack(spacing: 10) {
                        NavigationLink(destination: AddEmailView()) {
                            Text("Sign Up")
                                .font(Font.custom("Switzer Variable", size: 20).weight(.medium))
                                .foregroundColor(.white)
                                .frame(width: 114, height: 43)
                                .background(Color(hex: "9F85FF"))
                                .cornerRadius(10)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 30)
                        }
                        
                        NavigationLink(destination: LoginPageView()) {
                            Text("Login")
                                .font(Font.custom("Switzer Variable", size: 20).weight(.medium))
                                .foregroundColor(.white)
                                .frame(width: 114, height: 43)
                                .background(Color(hex: "9F85FF"))
                                .cornerRadius(10)
                                .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 30)
                        }
                    }
                    .padding(.bottom, 30)
                    .frame(maxHeight: .infinity, alignment: .bottom)
                    .opacity(showButtons ? 1 : 0)
                    .animation(.easeIn(duration: 2), value: showButtons)
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                            withAnimation {
                                self.showButtons = true
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
