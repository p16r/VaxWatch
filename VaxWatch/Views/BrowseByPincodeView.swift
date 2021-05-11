import SwiftUI

struct BrowseByPincodeView: View {

    @State var pincodeString: String = ""

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Pincode")) {
                    TextField("110001", text: $pincodeString, onCommit: {
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
