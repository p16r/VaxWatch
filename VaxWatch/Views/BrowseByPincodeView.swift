import SwiftUI

struct BrowseByPincodeView: View {

    @StateObject var centersViewModel = CentersViewModel()
    @State var pincodeString: String = ""
    @State var pincodeMessage: String? = nil

    private var pincode: Int? {
        Int(pincodeString)
    }

    var body: some View {
        NavigationView {
            Form {
                Section(
                    header: Text("Pincode"),
                    footer: pincodeMessage.map { Text($0).foregroundColor(.red) }
                ) {
                    HStack {
                        TextField("110001", text: $pincodeString, onCommit: fetchCenters)
                            .keyboardType(.numbersAndPunctuation)
                        Button("Search", action: fetchCenters)
                    }
                }
                if let centers = centersViewModel.centers {
                    Section(header: Text(centersViewModel.centersFoundTitle)) {
                        ForEach(centers) { center in
                            let viewModel = CenterViewModel(center: center)
                            NavigationLink(destination: CenterDetailView(centerViewModel: viewModel)) {
                                CenterListCell(centerViewModel: viewModel)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Browse By Pincode")
        }
    }

    private func fetchCenters() {
        if pincodeString.count != 6 { return pincodeMessage = "Pincode must be 6 digits long only." }
        guard let pincode = pincode else { return pincodeMessage = "Pincode can only contain numbers." }
        pincodeMessage = nil
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
        centersViewModel.fetchCentres(in: pincode)
    }

}

struct BrowseByPincodeView_Previews: PreviewProvider {

    static var previews: some View {
        BrowseByPincodeView()
    }

}
