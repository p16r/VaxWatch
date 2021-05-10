import Combine
import Foundation

struct APIClient {

    func statesPublisher() -> AnyPublisher<Result<[Int: String], Error>, Never> {
        guard let url = URL(string: "https://cdn-api.co-vin.in/api/v2/admin/location/states") else {
            return Fail(error: URLError(.badURL))
                .asResult()
        }

        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .mapError { $0 as Error }
            .decode(type: States.self, decoder: JSONDecoder())
            .map(\.states)
            .asResult()
    }

    func districtsPublisher(for stateID: Int) -> AnyPublisher<Result<[Int: String], Error>, Never> {
        guard let url = URL(string: "https://cdn-api.co-vin.in/api/v2/admin/location/districts/\(stateID)") else {
            return Fail(error: URLError(.badURL))
                .asResult()
        }

        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: Districts.self, decoder: JSONDecoder())
            .map(\.districts)
            .asResult()
    }

    func centersByDistrictPublisher(
        for districtID: Int,
        on date: Date
    ) -> AnyPublisher<Result<[Center], Error>, Never> {
        let parameters = [
            URLQueryItem(name: "district_id", value: String(describing: districtID)),
            URLQueryItem(name: "date", value: DateFormatter.shared.string(from: date))
        ]
        return centersPublisher(for: parameters)
    }

    func centersByPincodePublisher(for pincode: Int, on date: Date) -> AnyPublisher<Result<[Center], Error>, Never> {
        let parameters = [
            URLQueryItem(name: "pincode", value: String(describing: pincode)),
            URLQueryItem(name: "date", value: DateFormatter.shared.string(from: date))
        ]
        return centersPublisher(for: parameters)
    }

    private func centersPublisher(for parameters: [URLQueryItem]) -> AnyPublisher<Result<[Center], Error>, Never> {
        let urlString = "https://cdn-api.co-vin.in/api/v2/appointment/sessions/public/calendarByDistrict"
        guard var components = URLComponents(string: urlString) else {
            return Fail(error: URLError(.badURL))
                .asResult()
        }
        components.queryItems = parameters
        guard let url = components.url else {
            return Fail(error: URLError(.badURL))
                .asResult()
        }

        struct Centers: Decodable {

            let centers: [Center]

        }

        return URLSession.shared
            .dataTaskPublisher(for: url)
            .mapError { $0 as Error }
            .flatMap { (data, response) -> AnyPublisher<Centers, Error> in
                switch (response as? HTTPURLResponse)?.statusCode {
                    case 401:
                        return String(data: data, encoding: .utf8)
                            .publisher
                            .map { ServerError(error: $0) }
                            .flatMap(Fail<Centers, Error>.init)
                            .eraseToAnyPublisher()
                    case 400:
                        return Just(data)
                            .decode(type: ServerError.self, decoder: JSONDecoder())
                            .flatMap(Fail<Centers, Error>.init)
                            .eraseToAnyPublisher()
                    default:
                        return Just(data)
                            .decode(type: Centers.self, decoder: JSONDecoder())
                            .eraseToAnyPublisher()
                }
            }
            .map(\.centers)
            .asResult()
    }

}
