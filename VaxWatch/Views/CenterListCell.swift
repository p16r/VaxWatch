import SwiftUI

struct CenterListCell: View {

    let centerViewModel: CenterViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(centerViewModel.name)
                    .font(.headline)
                Text(centerViewModel.addressString)
                    .foregroundColor(.secondary)
            }
            Spacer()
            Text(centerViewModel.feeType)
                .font(Font.body.monospacedDigit())
                .fontWeight(.bold)
                .textCase(.uppercase)
                .foregroundColor(.white)
                .padding(.vertical, 2)
                .padding(.horizontal, 8)
                .background(centerViewModel.feeTypeBackgroundColor)
                .clipShape(Capsule())
        }
        .padding(.vertical, 4)
    }

}

struct CenterListView_Previews: PreviewProvider {

    static let center = Center(
        id: 123,
        name: "SDFASF",
        address: "Lorem ipsum sit dolor amet",
        state: "Maarashrta",
        district: "AASDAD",
        pincode: 400023,
        feeType: "Paid",
        sessions: []
    )

    static var previews: some View {
        CenterListCell(centerViewModel: CenterViewModel(center: center))
    }

}
