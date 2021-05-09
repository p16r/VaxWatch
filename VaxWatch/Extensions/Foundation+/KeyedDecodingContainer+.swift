import Foundation

extension KeyedDecodingContainer {

    func decode<D: Decodable>(_ key: Key, as decodableType: D.Type = D.self) throws -> D {
        try self.decode(decodableType, forKey: key)
    }

    func decode<D: Decodable>(ifPresent key: Key, as decodableType: D.Type = D.self) throws -> D? {
        try self.decodeIfPresent(decodableType, forKey: key)
    }

}
