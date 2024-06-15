import SwiftUI

// MARK: - Rounded Corners Shape
/// RoundedCorners creates a shape with custom rounded corners.
struct RoundedCorners: View {
    let color: Color
    let tl: CGFloat
    let tr: CGFloat
    let bl: CGFloat
    let br: CGFloat
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height
                
                let tr = min(min(self.tr, h/2), w/2)
                let tl = min(min(self.tl, h/2), w/2)
                let bl = min(min(self.bl, h/2), w/2)
                let br = min(min(self.br, h/2), w/2)
                
                path.move(to: CGPoint(x: w/2, y: 0))
                path.addLine(to: CGPoint(x: w-tr, y: 0))
                path.addArc(center: CGPoint(x: w-tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h-br))
                path.addArc(center: CGPoint(x: w-br, y: h-br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h-bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: -90), clockwise: false)
                path.closeSubpath()
            }
            .fill(self.color)
        }
    }
}

// MARK: - Preview Provider
struct RoundedCorners_Previews: PreviewProvider {
    static var previews: some View {
        RoundedCorners(color: .blue, tl: 10, tr: 10, bl: 10, br: 10)
            .frame(width: 100, height: 100)
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
