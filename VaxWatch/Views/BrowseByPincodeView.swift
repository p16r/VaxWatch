import SwiftUI

struct BrowseByPincodeView: View {

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
                        if pincode == nil { return pincodeMessage = "Pincode can only contain numbers." }
                        pincodeMessage = nil
                        print(pincodeString)
                    })
                    .keyboardType(.numbersAndPunctuation)
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
