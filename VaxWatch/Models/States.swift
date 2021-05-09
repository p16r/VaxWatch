import Foundation

struct States: Decodable {

    let states: [Int: String]

    init(states: [Int : String]) {
        self.states = states
    }

    init(from decoder: Decoder) throws {
        let statesContainer = try decoder
            .container(keyedBy: AnyCodingKey.self)
            .nestedUnkeyedContainer(forKey: "states")
        let seq = sequence(state: statesContainer) { container -> (key: Int, value: String)? in
            if container.isAtEnd { return nil }
            guard
                let nestedContainer = try? container.nestedContainer(keyedBy: AnyCodingKey.self),
                let key = try? nestedContainer.decode("state_id", as: Int.self),
                let value = try? nestedContainer.decode("state_name", as: String.self)
            else { return nil }
            return (key, value)
        }
        self.states = seq.reduce(into: [Int: String]()) { dictionary, tuple in
            dictionary[tuple.key] = tuple.value
        }
    }

}
