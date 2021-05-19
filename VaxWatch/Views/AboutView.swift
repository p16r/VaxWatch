import SwiftUI

struct AboutView: View {

    private let aboutVaxWatchString = """
    This app uses the Co-WIN Public API provided by API Setu to browse vaccination centers by district or pincode and \
    display information and availability of vaccination slots.
    The appointment availability data that this app fetches is not live, but from a cache that may be upto 30 minutes \
    old. Live data is not made publicly available for third-party use.
    """
    private let aboutMeString = """
    This open-source app is made by me, Prathamesh Kowarkar, an iOS app developer from Mumbai, India.
    """
    private let githubRepoURL = URL(string: "https://github.com/prtmshk/VaxWatch")!
    private let githubURL = URL(string: "https://github.com/prtmshk")!
    private let twitterURL = URL(string: "https://twitter.com/prtmshk")!
    private let emailURL = URL(string: "mailto:prathamesh.kowarkar@gmail.com")!
    private let privacyURL = URL(string: "https://github.com/prtmshk/VaxWatch/blob/main/PRIVACY.md")!

    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("About This App")) {
                    Text(aboutVaxWatchString)
                }
                Section(header: Text("This App Is Open-Source!")) {
                    Link("View source code on GitHub", destination: githubRepoURL)
                }
                Section(header: Text("About Me")) {
                    Text(aboutMeString)
                }
                Section(header: Text("Contact Me")) {
                    Link("Twitter", destination: twitterURL)
                    Link("GitHub", destination: githubURL)
                    Link("Email", destination: emailURL)
                }
                Section(header: Text("VaxWatch Values Your Privacy")) {
                    Link("Read the full policy here", destination: privacyURL)
                }
            }
            .navigationTitle("About VaxWatch")
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

}

struct AboutView_Previews: PreviewProvider {

    static var previews: some View {
        AboutView()
    }

}
