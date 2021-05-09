import Foundation

struct Center: Identifiable, Hashable {

    let id: Int
    let name: String
    let address: String
    let state: String
    let district: String
    let pincode: Int
    let feeType: String
    let sessions: [Session]

}

extension Center: Decodable {

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: AnyCodingKey.self)
        self.id = try container.decode("center_id")
        self.name = try container.decode("name")
        self.address = try container.decode("address")
        self.state = try container.decode("state_name")
        self.district = try container.decode("district_name")
        self.pincode = try container.decode("pincode")
        self.feeType = try container.decode("fee_type")
        self.sessions = try container.decode("sessions")
    }

}
