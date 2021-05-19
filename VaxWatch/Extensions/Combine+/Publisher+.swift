import Combine

extension Publisher {

    func asResult() -> AnyPublisher<Result<Output, Failure>, Never> {
        let asdf = self
            .flatMap { Just(Result.success($0)) }
            .catch { Just(Result.failure($0)) }
        return asdf.eraseToAnyPublisher()
    }

}
