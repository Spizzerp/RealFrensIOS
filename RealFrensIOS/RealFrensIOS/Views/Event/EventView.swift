import SwiftUI

// MARK: - Event View
/// EventView displays the details of an event, including a photo carousel, description, and comments.
struct EventView: View {
    // MARK: - Properties
    @StateObject private var viewModel: EventViewModel
    
    @Environment(\.presentationMode) var presentationMode
    
    init(event: Event) {
        _viewModel = StateObject(wrappedValue: EventViewModel(event: event))
    }
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack {
                // Title Section
                EventTitleSection(event: viewModel.event, presentationMode: _presentationMode)

                // Photo Carousel
                EventPhotoCarousel(images: viewModel.event.images, selectedPhotoIndex: $viewModel.selectedPhotoIndex)
                
                // Small Photo Thumbnails
                EventPhotoThumbnails(images: viewModel.event.images, selectedPhotoIndex: $viewModel.selectedPhotoIndex)
                
                // Description Section
                EventDescriptionSection(description: "Join us for an evening of fun and festivities. We're bringing Web3 to reality. All are welcome and we've got some special prizes for attendees. LFG!")
                
                // RSVP, Share, and Attendees Section
                EventRSVPShareAttendeesSection()
                
                // Divider
                Image("Divider")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 15)
                    .padding(.horizontal)
                    .padding(.vertical, -5)
                
                // Comments Section
                EventCommentsSection(comments: $viewModel.comments)
                
                EventAddCommentSection(newComment: $viewModel.newComment, addCommentAction: viewModel.addComment)
            }
            .padding(.top, -20)
            .background(Color(hex: "181818").edgesIgnoringSafeArea(.all))
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            // Tab Bar View
            VStack {
                Spacer()
                TabBarView(
                    onProfileSelected: {
                        print("Profile Selected")
                        // Navigate to Profile
                    },
                    onContentSelected: {
                        print("Content Selected")
                        // Navigate to Content
                    }
                )
                .padding(.bottom, 20)
                .background(Color.clear)
            }
            .edgesIgnoringSafeArea(.bottom)
        }
    }
}

// MARK: - Preview Provider
struct EventView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleDate = Date()
        let sampleEvent = Event(id: 1, title: "Breakpoint", location: "SGP", time: "6:00 PM", date: sampleDate, images: ["Mocksgp1", "Mocksgp2", "Mocksgp3"])
        EventView(event: sampleEvent)
    }
}
