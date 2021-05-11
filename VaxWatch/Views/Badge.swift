import SwiftUI

struct Badge: View {

    let text: String
    let foregroundColor: Color
    let backgroundColor: Color
    @ScaledMetric var verticalPadding: CGFloat = 2
    @ScaledMetric var horizontalPadding: CGFloat = 8

    var body: some View {
        Text(text)
            .font(Font.body.monospacedDigit())
            .fontWeight(.bold)
            .textCase(.uppercase)
            .foregroundColor(foregroundColor)
            .padding(
                EdgeInsets(
                    top: verticalPadding,
                    leading: horizontalPadding,
                    bottom: verticalPadding,
                    trailing: horizontalPadding
                )
            )
            .background(backgroundColor)
            .clipShape(Capsule())
    }

}
