import SwiftUI

struct RootTabView: View {

    var body: some View {
        TabView {
            BrowseByDistrictView()
                .tabItem { Label("District", systemImage: "map") }
        }
    }

}

struct RootTabView_Previews: PreviewProvider {

    static var previews: some View {
        RootTabView()
    }

}
