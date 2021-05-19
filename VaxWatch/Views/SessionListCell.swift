import SwiftUI

struct SessionListCell: View {

    let sessionViewModel: SessionViewModel

    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 0) {
                    Text("Age Limit: ")
                        .fontWeight(.bold)
                    Text(sessionViewModel.ageLimitString)
                }
                HStack(spacing: 0) {
                    Text("Vaccine: ")
                        .fontWeight(.bold)
                    Text(sessionViewModel.vaccine)
                }
            }
            .padding(.vertical, 4)
            Spacer()
            Badge(
                text: String(describing: sessionViewModel.capacity),
                foregroundColor: .white,
                backgroundColor: sessionViewModel.capacityBackgroundColor
            )
        }
    }

    func backgroundColor(for capacity: Int) -> Color {
        capacity == 0 ? .red : .green
    }

}

struct SessionListCell_Previews: PreviewProvider {

    static let session = Session(
        id: UUID(),
        date: "10-05-2021",
        capacity: 450,
        ageLimit: 18,
        vaccine: "COVISHIELD"
    )

    static var previews: some View {
        SessionListCell(sessionViewModel: SessionViewModel(session: session))
    }

}
