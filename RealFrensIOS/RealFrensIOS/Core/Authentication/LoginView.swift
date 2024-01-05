import SwiftUI

struct LoginView: View {

    var body: some View {
        NavigationView {
            ZStack(alignment: .bottom) {
                // Entire screen's background color
                Color.black.edgesIgnoringSafeArea(.all)

                // Adjusted Gradient overlay
                LinearGradient(gradient: Gradient(colors: [Color.purple, Color.black]), startPoint: .top, endPoint: .center)
                    .edgesIgnoringSafeArea(.all)
                    .opacity(0.6) // Adjust opacity for blending effect

                // Globe background image at the bottom
                Image("GlobeWBalls")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 250) // Adjust the height as needed
                    .edgesIgnoringSafeArea(.all)
                
                VStack {
                    VStack(spacing: -30) {
                        Text("WELCOME")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)

                        Image("TextLogo")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 220, height: 150)

                        Text("THE WORLD IS (Y)OURS")
                            .font(.system(size: 14, weight: .semibold))
                            .foregroundColor(.white)
                    }
                    .padding(.top, 140)

                    HStack(spacing: 10) {
                        NavigationLink(destination: AddEmailView()) {
                            Text("Sign Up")
                                .font(.headline)
                                .frame(width: 100, height: 40)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.25), lineWidth: 5))
                        }

                        NavigationLink(destination: LoginPageView()) {
                            Text("Login")
                                .font(.headline)
                                .frame(width: 100, height: 40)
                                .background(Color.gray)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                                .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.25), lineWidth: 5))
                        }
                    }
                    .padding(.bottom, 20)
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
