import Foundation

extension NumberFormatter {

    static let shared: NumberFormatter = { formatter in
        formatter.formattingContext = .standalone
        formatter.numberStyle = .currency
        return formatter
    } (NumberFormatter())

}
