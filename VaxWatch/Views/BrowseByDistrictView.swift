import SwiftUI

struct BrowseByDistrictView: View {

    @StateObject var appModel = DistrictsViewModel()
    @StateObject var centersModel = CentersViewModel()
    @State var selectedStateIndex = 0
    @State var selectedDistrictIndex = 0

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Details")) {
                    if appModel.states.isEmpty {
                        Button("Fetch States List", action: appModel.fetchStates)
                    } else {
                        Picker("State", selection: $selectedStateIndex) {
                            ForEach(appModel.states.sorted { $0.value < $1.value }, id: \.key) { state in
                                Text(state.value)
                            }
                        }
                    }
                    if selectedStateIndex != 0 {
                        if let state = appModel.states[selectedStateIndex], appModel.districts.isEmpty {
                            Button("Fetch Districts List for \(state)") {
                                appModel.fetchDistricts(for: selectedStateIndex)
                            }
                        } else {
                            Picker("District", selection: $selectedDistrictIndex) {
                                ForEach(appModel.districts.sorted { $0.value < $1.value }, id: \.key) { district in
                                    Text(district.value)
                                }
                            }
                        }
                    }
                }
                if let centers = centersModel.centers {
                    Section(header: Text(centersModel.centersFoundTitle)) {
                        ForEach(centers) { center in
                            let viewModel = CenterViewModel(center: center)
                            NavigationLink(destination: CenterDetailView(centerViewModel: viewModel)) {
                                CenterListCell(centerViewModel: viewModel)
                            }
                        }
                    }
                }
            }
            .onChange(of: selectedStateIndex) { index in
                appModel.fetchDistricts(for: index)
            }
            .onChange(of: selectedDistrictIndex) { index in
                if index == 0 { return }
                centersModel.fetchCentres(for: index)
            }
            .navigationTitle("Browse By Districts")
        }
        .alert(isPresented: .constant(appModel.errorMessage != nil)) {
            Alert(
                title: Text("Error"),
                message: appModel.errorMessage.map { Text($0) },
                dismissButton: .cancel(Text("OK")) {
                    appModel.errorMessage = nil
                }
            )
        }
        .alert(isPresented: .constant(centersModel.errorMessage != nil)) {
            Alert(
                title: Text("Error"),
                message: centersModel.errorMessage.map { Text($0) },
                dismissButton: .cancel(Text("OK")) {
                    centersModel.errorMessage = nil
                }
            )
        }
        .onAppear(perform: appModel.fetchStates)
    }

}

struct BrowseByDistrictView_Previews: PreviewProvider {

    static var previews: some View {
        BrowseByDistrictView()
    }

}
