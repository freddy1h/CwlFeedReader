import Combine
import Foundation
import Model

extension URLSessionDataTask: Cancellable {}

extension URLSession: NetworkService {
	public func fetchData(with request: URLRequest, handler: @escaping (Data?, URLResponse?, Error?) -> Void) -> AnyCancellable {
		let task = dataTask(with: request, completionHandler: handler)
		task.resume()
		return AnyCancellable(task)
	}

    @available(iOS 15.0, macOS 12.0, *)
    public func fetchDataAsync(for request: URLRequest, delegate: URLSessionTaskDelegate? = nil) async throws -> (Data, URLResponse) {
        return try await data(for: request, delegate: delegate)
    }
}
