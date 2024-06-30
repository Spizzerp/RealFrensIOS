import SwiftUI

/// A view component that displays filter options for the messaging view.
struct FilterView: View {
    /// Binding to the currently selected filter
    @Binding var selectedFilter: Filter
    
    /// Enum representing the available filter options
    enum Filter: String, CaseIterable {
        case all = "All"
        case unread = "Unread"
        case groups = "Groups"
    }
    
    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 10) {
                ForEach(Filter.allCases, id: \.self) { filter in
                    Button(action: {
                        selectedFilter = filter
                    }) {
                        Text(filter.rawValue)
                            .font(.system(size: 14, weight: .medium))
                            .frame(width: (geometry.size.width - 20) / 3, height: 36) // Equal width for each button, minus spacing
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(selectedFilter == filter ? Color(hex: "9F85FF") : Color(hex: "2C2C2E"))
                            )
                            .foregroundColor(selectedFilter == filter ? .black : .white)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .frame(width: geometry.size.width)
        }
        .frame(height: 36)
        .padding(.horizontal, 16)
    }
}

// MARK: - Preview
struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView(selectedFilter: .constant(.all))
            .previewLayout(.sizeThatFits)
            .padding()
            .background(Color.black)
    }
}
