import Foundation

struct ServerError: LocalizedError, Decodable {

    let errorCode: String?
    let error: String

    var errorDescription: String? { error }

    init(errorCode: String? = nil, error: String) {
        self.errorCode = errorCode
        self.error = error
    }

}
