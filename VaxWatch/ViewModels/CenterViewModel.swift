import SwiftUI

@dynamicMemberLookup
struct CenterViewModel {

    let center: Center

    subscript<T>(dynamicMember keyPath: KeyPath<Center, T>) -> T {
        center[keyPath: keyPath]
    }

    var addressString: String {
        """
        \(center.address)
        \(center.district), \(center.state), \(String(describing: center.pincode))
        """
    }

    var feeTypeBackgroundColor: Color {
        switch center.feeType.uppercased() {
            case "FREE": return .green
            case "PAID": return .red
            default: return .clear
        }
    }

}
