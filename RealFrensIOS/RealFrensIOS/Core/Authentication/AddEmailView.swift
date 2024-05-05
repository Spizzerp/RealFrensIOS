import SwiftUI

struct AddEmailView: View {
    @State private var email = ""
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
                Text("Input your email")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)

                Text("You'll use this email to sign in to your account")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)

                TextField("Email", text: $email)
                    .autocapitalization(.none)
                    .modifier(RFTextFieldModifier())

                NavigationLink {
                    CreateUsernameView()
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

struct AddEmailView_Previews: PreviewProvider {
    static var previews: some View {
        AddEmailView()
    }
}
