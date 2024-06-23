import SwiftUI

/// The top-level view for the messaging functionality of the app.
struct MessagingView: View {
    // MARK: - Properties
    
    /// The view model that manages the messaging data and logic.
    @StateObject private var viewModel = MessageViewModel()
    
    /// The current search text entered by the user.
    @State private var searchText = ""
    
    /// The currently selected conversation, if any.
    @State private var selectedConversation: Conversation?
    
    /// A flag indicating whether the more options view is being shown.
    @State private var showingMoreOptions = false
    
    /// A flag indicating whether the new conversation view is being shown.
    @State private var showingNewConversationView = false
    
    /// A flag indicating whether the settings view is being shown.
    @State private var showingSettings = false

    // MARK: - Body
    
    var body: some View {
        NavigationView {
            ZStack {
                BackgroundGradientView()

                VStack(spacing: 0) {
                    ConversationSearchBarView(searchText: $searchText)
                    ConversationListView(
                        viewModel: viewModel,
                        searchText: searchText,
                        selectedConversation: $selectedConversation,
                        showingMoreOptions: $showingMoreOptions
                    )
                }

                NewConversationButton(showingNewConversationView: $showingNewConversationView)
            }
            .navigationBarTitle("Messages", displayMode: .inline)
            .navigationBarItems(
                leading: settingsButton,
                trailing: NavigationMenuView()
            )
        }
        .sheet(isPresented: $showingMoreOptions) {
            if let conversation = selectedConversation {
                MoreOptionsView(conversation: conversation)
            }
        }
        .sheet(isPresented: $showingNewConversationView) {
            NewConversationView()
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
    }
    
    // MARK: - Subviews
    
    /// The button that opens the settings view.
    private var settingsButton: some View {
        Button(action: {
            showingSettings = true
        }) {
            Image(systemName: "gear")
                .foregroundColor(.white)
        }
    }
}

/// A view for the navigation menu.
struct NavigationMenuView: View {
    var body: some View {
        Menu {
            Button(action: {
                // Action for Archived chats
            }) {
                Label("Archived chats", systemImage: "archivebox")
            }
            Button(action: {
                // Action for New group
            }) {
                Label("New group", systemImage: "person.3")
            }
        } label: {
            Image(systemName: "ellipsis")
                .rotationEffect(.degrees(90))
                .foregroundColor(.white)
        }
    }
}

/// A placeholder view for the settings screen.
struct SettingsView: View {
    var body: some View {
        Text("Settings")
            .navigationBarTitle("Settings", displayMode: .inline)
    }
}

/// A view that displays a gradient background.
struct BackgroundGradientView: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color(red: 0.18, green: 0.18, blue: 0.18), Color(red: 0.09, green: 0.09, blue: 0.09)]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}

/// A button for creating a new conversation.
struct NewConversationButton: View {
    @Binding var showingNewConversationView: Bool

    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: {
                    showingNewConversationView = true
                }) {
                    Image(systemName: "plus")
                        .foregroundColor(Color(hex: "181818"))
                        .font(.system(size: 24))
                        .frame(width: 60, height: 60)
                        .background(Color(hex: "9F85FF"))
                        .clipShape(Circle())
                        .shadow(radius: 5)
                }
                .padding(.trailing, 20)
                .padding(.bottom, 60)
            }
        }
    }
}

// MARK: - Preview

struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingView()
    }
}
