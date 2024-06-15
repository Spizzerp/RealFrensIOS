import SwiftUI

struct CompleteSignupView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showLogo = false
    @State private var navigateToNextPage = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color(red: 0.18, green: 0.18, blue: 0.18), Color(red: 0.09, green: 0.09, blue: 0.09)]),
                startPoint: .top, endPoint: .bottom
            ).edgesIgnoringSafeArea(.all)

            VStack {
                // Custom back button
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .foregroundColor(.white)
                    }
                    Spacer()
                }
                .padding()

                if !showLogo {
                    // Main content
                    Text("Welcome to RealFrens")
                        .font(Font.custom("Inter", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top)

                    Text("Click below to complete your registration and begin using RealFrens")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)

                    Button {
                        withAnimation {
                            showLogo = true
                        }

                        // Delay for animation
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            navigateToNextPage = true
                        }
                    } label: {
                        Text("Complete sign up")
                            .font(Font.custom("Inter", size: 20).weight(.medium))
                            .foregroundColor(.white)
                            .frame(width: 345, height: 43)
                            .background(Color(red: 0.62, green: 0.52, blue: 1))
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 30)
                    }
                    .padding(.vertical)
                    
                    // "OR" Text
                    Text("OR")
                        .font(Font.custom("Inter", size: 20).weight(.bold))
                        .foregroundColor(.white)
                        .padding(.vertical)

                    // Connect Wallet to Account button
                    Button(action: {
                        // Add action for "Connect Wallet to Account"
                    }) {
                        Text("Link Wallet")
                            .font(Font.custom("Inter", size: 20).weight(.medium))
                            .foregroundColor(.white)
                            .frame(width: 345, height: 43)
                            .background(Color(red: 0.62, green: 0.52, blue: 1))
                            .cornerRadius(10)
                            .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 30)
                    }
                    .padding(.vertical)
                    
                    // New instruction text below "Link Wallet" button
                    Text("Have a Web3 wallet? Link your wallet to your account. Don't worry, you can do this later.")
                        .font(Font.custom("Inter", size: 14))
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 24)
                }

                if showLogo {
                    Spacer()
                    Image("Logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .opacity(showLogo ? 10 : 0)
                        .scaleEffect(showLogo ? 1 : 0.10)
                }

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CompleteSignupView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignupView()
    }
}
