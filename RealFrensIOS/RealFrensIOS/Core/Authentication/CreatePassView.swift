import SwiftUI

struct CreatePassView: View {
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode

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

                // Rest of your view content
                Text("Create a password")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)

                Text("Your password must be at least 6 characters long")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)

                SecureField("Password", text: $password)
                    .autocapitalization(.none)
                    .modifier(RFTextFieldModifier())

                NavigationLink {
                   CompleteSignupView()
                } label: {
                    Text("Next")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 340, height: 44)
                        .background(Color.gray)
                        .cornerRadius(10)
                        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color.white.opacity(0.25), lineWidth: 5))
                }
                .padding(.vertical)

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true) // Hide the default back button
    }
}

struct CreatePassView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePassView()
    }
}
