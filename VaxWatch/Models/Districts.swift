import Foundation

struct Districts: Decodable {

    let districts: [Int: String]

    init(districts: [Int : String]) {
        self.districts = districts
    }

    init(from decoder: Decoder) throws {
        let districtContainer = try decoder
            .container(keyedBy: AnyCodingKey.self)
            .nestedUnkeyedContainer(forKey: "districts")
        let seq = sequence(state: districtContainer) { container -> (key: Int, value: String)? in
            if container.isAtEnd { return nil }
            guard
                let nestedContainer = try? container.nestedContainer(keyedBy: AnyCodingKey.self),
                let key = try? nestedContainer.decode("district_id", as: Int.self),
                let value = try? nestedContainer.decode("district_name", as: String.self)
            else { return nil }
            return (key, value)
        }
        self.districts = seq.reduce(into: [Int: String]()) { dictionary, tuple in
            dictionary[tuple.key] = tuple.value
        }
    }

}
