import SwiftUI

struct CenterListCell: View {

    let centerViewModel: CenterViewModel

    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .firstTextBaseline) {
                Text(centerViewModel.name)
                    .font(.headline)
                Spacer()
                Text(centerViewModel.feeType)
                    .font(Font.body.monospacedDigit())
                    .fontWeight(.bold)
                    .textCase(.uppercase)
                    .foregroundColor(.white)
                    .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                    .background(centerViewModel.feeTypeBackgroundColor)
                    .clipShape(Capsule())
            }
            Text(centerViewModel.addressString)
                .font(Font.body.leading(.tight))
                .foregroundColor(.secondary)
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
        sessions: [],
        fees: nil
    )

    static var previews: some View {
        CenterListCell(centerViewModel: CenterViewModel(center: center))
    }

}
