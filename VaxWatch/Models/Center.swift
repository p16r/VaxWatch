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
    let fees: [String: Int]?

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

        struct VaccineFee: Decodable {

            let vaccine: String
            let fee: String

        }

        self.fees = try container.decode(ifPresent: "vaccine_fees", as: [VaccineFee].self)?
            .reduce(into: [:]) { (dictionary, vaccineFee) in
                dictionary[vaccineFee.vaccine] = Double(vaccineFee.fee).map(Int.init)
            }
    }

}
