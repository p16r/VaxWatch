import SwiftUI

struct BrowseByDistrictView: View {

    @State var date = Date()

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    DatePicker("Vaccination Date", selection: $date, in: Date()..., displayedComponents: .date)
                }
            }
            .navigationTitle("Browse By Districts")
        }
    }

}

struct BrowseByDistrictView_Previews: PreviewProvider {

    static var previews: some View {
        BrowseByDistrictView()
    }

}
