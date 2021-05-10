import SwiftUI

struct CenterDetailView: View {

    let centerViewModel: CenterViewModel

    var body: some View {
        Form {
            Section(header: Text("Details")) {
                Text(centerViewModel.name)
                Text(centerViewModel.addressString)
            }
        }
        .navigationTitle("Center Details")
        .navigationBarTitleDisplayMode(.inline)
    }

}

struct CenterDetailView_Previews: PreviewProvider {

    static let center = Center(
        id: 1231,
        name: "Lorem Ipsum Sit Dolor",
        address: "Morbi cursus rutrum risus, sit amet aliquam mauris non. Nam bibendum viverra egestas.",
        state: "New York",
        district: "NYC",
        pincode: 400023,
        feeType: "Free",
        sessions: [
            Session(
                id: UUID(),
                date: "08-05-2021",
                capacity: 450,
                ageLimit: 18,
                vaccine: "COVISHIELD"
            ),
            Session(
                id: UUID(),
                date: "08-05-2021",
                capacity: 0,
                ageLimit: 45,
                vaccine: "Covaxin"
            ),
        ]
    )

    static var previews: some View {
        CenterDetailView(centerViewModel: CenterViewModel(center: center))
    }

}
