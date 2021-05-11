import Combine
import Foundation

class CentersViewModel: ObservableObject {

    @Published var centers: [Center]? = nil
    @Published var errorMessage: String? = nil

    private let apiClient = APIClient()
    private var cancellables = Set<AnyCancellable>()

    var centersFoundTitle: String {
        switch centers?.count {
            case .none: return ""
            case .some(0): return "No Centers Found"
            case .some(1): return "1 Center Found"
            case .some(let count): return "\(count) Centers Found"
        }
    }

    func fetchCentres(for districtIndex: Int) {
        centers = nil
        apiClient
            .centersByDistrictPublisher(for: districtIndex)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                    case .success(let centers):
                        self?.centers = centers
                    case .failure(let error):
                        self?.errorMessage = "\(error.localizedDescription)\nPlease try again later."
                }
            }
            .store(in: &cancellables)
    }

    func fetchCentres(in pincode: Int) {
        centers = nil
        apiClient
            .centersByPincodePublisher(for: pincode)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                    case .success(let centers):
                        self?.centers = centers
                    case .failure(let error):
                        self?.errorMessage = "\(error.localizedDescription)\nPlease try again later."
                }
            }
            .store(in: &cancellables)
    }

}
