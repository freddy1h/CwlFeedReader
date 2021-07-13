import Combine
import Foundation

public protocol NetworkService {
	func fetchData(with: URLRequest, handler: @escaping (Data?, URLResponse?, Error?) -> Void) -> AnyCancellable

    @available(iOS 15.0, macOS 12.0, *)
    func fetchDataAsync(for request: URLRequest, delegate: URLSessionTaskDelegate?) async throws -> (Data, URLResponse)
}

public protocol KeyValueService: AnyObject {
	subscript<C: Codable>(key key: String, type type: C.Type) -> C? { get set }
}

public struct Services {
	public init(networkService: NetworkService, keyValueService: KeyValueService) {
		self.networkService = networkService
		self.keyValueService = keyValueService
	}
	
	let networkService: NetworkService
	let keyValueService: KeyValueService
}
