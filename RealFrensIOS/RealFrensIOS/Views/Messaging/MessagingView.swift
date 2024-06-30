import SwiftUI

/// The main view for the messaging functionality of the app.
struct MessagingView: View {
    // MARK: - Properties
    
    @StateObject private var viewModel = MessageViewModel()
    @State private var searchText = ""
    @State private var selectedConversation: Conversation?
    @State private var showingMoreOptions = false
    @State private var isShowingNewConversationView = false
    @State private var showingSettings = false
    @State private var selectedFilter: FilterView.Filter = .all
    
    private let usernameColor = Color(hex: "9F85FF")

    // MARK: - Body
    
    var body: some View {
        Group {
            if #available(iOS 16.0, *) {
                NavigationStack {
                    contentView
                        .navigationDestination(isPresented: $isShowingNewConversationView) {
                            NewConversationView()
                        }
                }
            } else {
                NavigationView {
                    contentView
                    NavigationLink(destination: NewConversationView(), isActive: $isShowingNewConversationView) {
                        EmptyView()
                    }
                }
            }
        }
        .sheet(isPresented: $showingMoreOptions) {
            if let conversation = selectedConversation {
                MoreOptionsView(conversation: conversation)
            }
        }
        .sheet(isPresented: $showingSettings) {
            SettingsView()
        }
    }
    
    // MARK: - Content View
    
    @ViewBuilder
    private var contentView: some View {
        ZStack {
            BackgroundGradientView()

            VStack(spacing: 16) {
                ConversationSearchBarView(searchText: $searchText)
                
                FilterView(selectedFilter: $selectedFilter)
                    .padding(.horizontal)
                
                ConversationListView(
                    viewModel: viewModel,
                    searchText: searchText,
                    selectedConversation: $selectedConversation,
                    showingMoreOptions: $showingMoreOptions,
                    usernameColor: usernameColor,
                    filter: selectedFilter
                )
            }

            NewConversationButton(isShowingNewConversationView: $isShowingNewConversationView)
        }
        .navigationBarTitle("Messages", displayMode: .inline)
        .navigationBarItems(trailing: NavigationMenuView(showingSettings: $showingSettings))
    }
}

// MARK: - Preview
struct MessagingView_Previews: PreviewProvider {
    static var previews: some View {
        MessagingView()
    }
}
