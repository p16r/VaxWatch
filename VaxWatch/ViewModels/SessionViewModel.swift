import SwiftUI

@dynamicMemberLookup
struct SessionViewModel {

    let session: Session

    var ageLimitString: String {
        String(describing: session.ageLimit) + "+"
    }

    var capacityBackgroundColor: Color {
        session.capacity == 0 ? .red : .green
    }

    subscript<T>(dynamicMember keyPath: KeyPath<Session, T>) -> T {
        session[keyPath: keyPath]
    }

}
