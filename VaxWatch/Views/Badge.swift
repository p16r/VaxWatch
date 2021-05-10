import SwiftUI

struct Badge: View {

    let text: String
    let foregroundColor: Color
    let backgroundColor: Color

    var body: some View {
        Text(text)
            .font(Font.body.monospacedDigit())
            .fontWeight(.bold)
            .textCase(.uppercase)
            .foregroundColor(foregroundColor)
            .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
            .background(backgroundColor)
            .clipShape(Capsule())
    }

}
