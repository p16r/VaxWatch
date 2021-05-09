import Foundation

struct Session: Identifiable, Hashable {

    let id: UUID
    let date: String
    let capacity: Int
    let ageLimit: Int
    let vaccine: String

}

extension Session: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        self.id = try container.decode("session_id")
        self.date = try container.decode("date")
        self.capacity = try container.decode("available_capacity")
        self.ageLimit = try container.decode("min_age_limit")
        self.vaccine = try container.decode("vaccine")
    }

}
