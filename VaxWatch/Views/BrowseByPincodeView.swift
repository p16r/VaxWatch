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
                    TextField("110001", text: $pincodeString, onCommit: {
                        if pincodeString.count != 6 { return pincodeMessage = "Pincode must be 6 digits long only." }
                        guard let pincode = pincode else { return pincodeMessage = "Pincode can only contain numbers." }
                        pincodeMessage = nil
                        centersViewModel.fetchCentres(in: pincode)
                    })
                    .keyboardType(.numbersAndPunctuation)
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

}

struct BrowseByPincodeView_Previews: PreviewProvider {

    static var previews: some View {
        BrowseByPincodeView()
    }

}
