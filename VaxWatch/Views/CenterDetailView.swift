import SwiftUI

struct CenterDetailView: View {

    let centerViewModel: CenterViewModel

    var body: some View {
        Form {
            Section(header: Text("Details")) {
                Text(centerViewModel.name)
                    .font(Font.body.leading(.tight))
                Text(centerViewModel.addressString)
                    .font(Font.body.leading(.tight))
            }
            Section(header: Text("Charges")) {
                if let fees = centerViewModel.fees?.sorted(by: { $0.key < $1.key }) {
                    ForEach(fees, id: \.key) { fee in
                        HStack {
                            Text(fee.key)
                            Spacer()
                            NumberFormatter.shared.string(from: fee.value as NSNumber)
                                .map {
                                    Text(verbatim: $0)
                                        .font(Font.body.monospacedDigit())
                                        .fontWeight(.bold)
                                        .textCase(.uppercase)
                                        .foregroundColor(.white)
                                        .padding(EdgeInsets(top: 2, leading: 8, bottom: 2, trailing: 8))
                                        .background(centerViewModel.feeTypeBackgroundColor)
                                        .clipShape(Capsule())
                                }
                        }
                    }
                } else {
                    ForEach(Set(centerViewModel.sessions.map(\.vaccine)).sorted(), id: \.self) { vaccine in
                        HStack {
                            Text(vaccine)
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
                    }
                }
            }
            let sessions = Dictionary(grouping: centerViewModel.sessions, by: \.date)
                .sorted { $0.key < $1.key }
            ForEach(sessions, id: \.key) { sessionGroup in
                Section(header: Text(sessionGroup.key)) {
                    ForEach(sessionGroup.value) { session in
                        SessionListCell(sessionViewModel: SessionViewModel(session: session))
                    }
                }
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
        ],
        fees: [
            "COVISHIELD": 700,
        ]
    )

    static var previews: some View {
        CenterDetailView(centerViewModel: CenterViewModel(center: center))
    }

}
