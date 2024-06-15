import SwiftUI

struct MapWrapperView: View {
    @Binding var selectedMap: Int
    @Binding var isSearchBarVisible: Bool
    @Binding var searchText: String
    
    var body: some View {
        ZStack {
            if selectedMap == 1 {
                Map1Wrapper()
                    .ignoresSafeArea()
            } else {
                Map2Wrapper()
                    .ignoresSafeArea()
            }

            VStack {
                HStack {
                    ZStack {
                        HStack(spacing: 10) {
                            SearchButtonView(isSearchBarVisible: $isSearchBarVisible)
                            
                            if isSearchBarVisible {
                                SearchBarView(searchText: $searchText)
                            }
                        }
                    }
                    Spacer()
                    AddPinButtonView()
                }
                .padding(.horizontal, 30)
                .padding(.top, 15)

                Spacer()
            }
        }
        .frame(height: UIScreen.main.bounds.height * 0.60)
    }
}
