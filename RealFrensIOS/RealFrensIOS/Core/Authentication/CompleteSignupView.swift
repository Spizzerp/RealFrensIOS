import SwiftUI

struct CompleteSignupView: View {
    @Environment(\.presentationMode) var presentationMode
    @State private var showLogo = false
    @State private var navigateToNextPage = false

    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Set background to black

            LinearGradient(gradient: Gradient(colors: [Color.white, Color.clear]), startPoint: .bottom, endPoint: .center)
                .edgesIgnoringSafeArea(.all)
                .opacity(0.6) // Adjust opacity for blending effect

            VStack {
                // Custom back button
                HStack {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
                                .imageScale(.large) // Make chevron larger
                                .foregroundColor(.white)
                        }
                    }
                    Spacer()
                }
                .padding()

                if !showLogo {
                    // Main content
                    Text("Welcome to RealFrens")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.top)

                    Text("Click below to complete your registration and begin using RealFrens")
                        .font(.footnote)
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
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundColor(.white)
                            .frame(width: 340, height: 44)
                            .background(Color.gray)
                            .cornerRadius(10)
                            .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.25), lineWidth: 5))
                    }
                    .padding(.vertical)
                }

                if showLogo {
                    Spacer()
                    Image("Logo") //
                        .resizable()
                        .scaledToFit()
                        .frame(width: 200, height: 200)
                        .opacity(showLogo ? 10 : 0)
                        .scaleEffect(showLogo ? 1 : 0.10)
                }

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
    }
}

struct CompleteSignupView_Previews: PreviewProvider {
    static var previews: some View {
        CompleteSignupView()
    }
}
