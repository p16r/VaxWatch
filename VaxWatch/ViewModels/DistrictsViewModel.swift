import Combine
import Foundation

class DistrictsViewModel: ObservableObject {

    @Published private(set) var states: [Int: String] = [:]
    @Published private(set) var districts: [Int: String] = [:]
    @Published var errorMessage: String? = nil

    private let apiClient = APIClient()
    private var cancellables = Set<AnyCancellable>()

    func fetchStates() {
        apiClient
            .statesPublisher()
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                    case .success(let dictionary):
                        self?.states = dictionary
                    case .failure(let error):
                        self?.states = [:]
                        self?.errorMessage = "\(error.localizedDescription)\nPlease try again later."
                }
            }
            .store(in: &cancellables)
    }

    func fetchDistricts(for stateID: Int) {
        apiClient
            .districtsPublisher(for: stateID)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                    case .success(let dictionary):
                        self?.districts = dictionary
                    case .failure(let error):
                        self?.districts = [:]
                        self?.errorMessage = "\(error.localizedDescription)\nPlease try again later."
                }
            }
            .store(in: &cancellables)
    }

}
