import Foundation

extension DateFormatter {

    static let shared: DateFormatter = { formatter in
        formatter.dateFormat = "dd-MM-yyyy"
        return formatter
    } (DateFormatter())

}
