import SwiftUI

struct LoginView: View {
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
                    .padding(.top, 130)
                    
                    
                    // Navigation section for logging in
                    HStack(spacing: 10) {
                        NavigationLink(destination: AddEmailView()) {
                            Text("Sign Up")
                                .font(.headline)
                                .frame(width: 100, height: 40)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.25), lineWidth: 3))
                        }
                        
                        NavigationLink(destination: LoginPageView()) {
                            Text("Login")
                                .font(.headline)
                                .frame(width: 100, height: 40)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.25), lineWidth: 3))
                        }
                    }
                    .padding(.bottom, 25)
                    .frame(maxHeight: .infinity, alignment: .bottom)
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
