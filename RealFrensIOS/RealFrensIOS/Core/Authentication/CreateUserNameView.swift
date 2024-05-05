import SwiftUI

struct CreateUsernameView: View {
    @State private var username = ""
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
                Text("Create username")
                    .font(.title2)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top)

                Text("This will be your public username")
                    .font(.footnote)
                    .foregroundColor(.gray)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)

                TextField("Username", text: $username)
                    .autocapitalization(.none)
                    .modifier(RFTextFieldModifier())

                NavigationLink {
                    CreatePassView()
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

struct CreateUserNameView_Previews: PreviewProvider {
    static var previews: some View {
        CreateUsernameView()
    }
}
