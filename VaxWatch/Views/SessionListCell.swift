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
            Text(String(describing: sessionViewModel.capacity))
                .font(Font.body.monospacedDigit())
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(.vertical, 2)
                .padding(.horizontal, 8)
                .background(sessionViewModel.capacityBackgroundColor)
                .clipShape(Capsule())
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
