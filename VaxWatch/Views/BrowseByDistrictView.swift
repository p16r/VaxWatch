import SwiftUI

struct BrowseByDistrictView: View {

    @State var date = Date()
    @StateObject var appModel = DistrictsViewModel()
    @State var selectedStateIndex = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    DatePicker("Vaccination Date", selection: $date, in: Date()..., displayedComponents: .date)
                    if appModel.states.isEmpty {
                        Button("Fetch States List", action: appModel.fetchStates)
                    } else {
                        Picker("State", selection: $selectedStateIndex) {
                            ForEach(appModel.states.sorted { $0.value < $1.value }, id: \.key) { state in
                                Text(state.value)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Browse By Districts")
        }
        .onAppear(perform: appModel.fetchStates)
    }

}

struct BrowseByDistrictView_Previews: PreviewProvider {

    static var previews: some View {
        BrowseByDistrictView()
    }

}
