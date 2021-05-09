import Foundation

/// A general purpose coding key for all encoding and decoding.
///
struct AnyCodingKey: CodingKey, ExpressibleByStringLiteral, ExpressibleByIntegerLiteral, Equatable {

    //  MARK: Instance Properties

    let stringValue: String
    let intValue: Int?

    //  MARK: - Initializers

    //  MARK: CodingKey Conformance

    init(stringValue: String) {
        self.stringValue = stringValue
        self.intValue = Int(stringValue)
    }

    init(intValue: Int) {
        self.stringValue = String(intValue)
        self.intValue = intValue
    }

    //  MARK: ExpressibleByStringLiteral Conformance

    init(stringLiteral value: String) {
        self.init(stringValue: value)
    }

    //  MARK: ExpressibleByIntegerLiteral Conformance

    init(integerLiteral value: Int) {
        self.init(intValue: value)
    }

}
