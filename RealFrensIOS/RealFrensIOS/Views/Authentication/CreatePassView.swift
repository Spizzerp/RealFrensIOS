import SwiftUI

struct CreatePassView: View {
    @State private var password = ""
    @Environment(\.presentationMode) var presentationMode

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

                // Rest of your view content
                Text("Create a password")
                    .font(Font.custom("Inter", size: 20).weight(.bold))
                    .foregroundColor(.white)
                    .padding(.top)

                Text("Your password must be at least 6 characters long")
                    .font(Font.custom("Inter", size: 14))
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
                        .font(Font.custom("Inter", size: 20).weight(.medium))
                        .foregroundColor(.white)
                        .frame(width: 345, height: 43)
                        .background(Color(red: 0.62, green: 0.52, blue: 1))
                        .cornerRadius(10)
                        .shadow(color: Color(red: 0, green: 0, blue: 0, opacity: 0.54), radius: 30)
                }
                .padding(.vertical)

                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

struct CreatePassView_Previews: PreviewProvider {
    static var previews: some View {
        CreatePassView()
    }
}
