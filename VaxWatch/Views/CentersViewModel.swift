import Combine
import Foundation

class CentersViewModel: ObservableObject {

    @Published var centers: [Center]? = nil
    @Published var errorMessage: String? = nil

    private let apiClient = APIClient()
    private var cancellables = Set<AnyCancellable>()

    func fetchCentres(for districtIndex: Int, on date: Date) {
        apiClient
            .centersByDistrictPublisher(for: districtIndex, on: date)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] result in
                switch result {
                    case .success(let centers):
                        self?.centers = centers
                    case .failure(let error):
                        self?.centers = nil
                        self?.errorMessage = "\(error.localizedDescription)\nPlease try again later."
                }
            }
            .store(in: &cancellables)
    }

}
