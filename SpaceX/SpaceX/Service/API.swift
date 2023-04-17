//
//  API.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

protocol APIServiceProtocol {
	func request<T: Decodable>(route: ServiceConfiguration, result: @escaping (Result<T, ServiceError>) -> Void)
}

class APIService: APIServiceProtocol {
	static let shared = APIService()
	
	func request<T: Decodable>(route: ServiceConfiguration, result: @escaping (Result<T, ServiceError>) -> Void) {
		guard let url = URL(string: route.urlString) else {
			result(.failure(.invalidURL))
			return
		}
		
		var urlRequest = URLRequest(url: url)
		urlRequest.httpMethod = route.method.rawValue
		
		let _ = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
			if let error = error {
				DispatchQueue.main.async {
					result(.failure(.networkError(error)))
				}
				return
			}
			
			guard response is HTTPURLResponse else {
				DispatchQueue.main.async {
					result(.failure(.serverError(statusCode: 0)))
				}
				return
			}
			
			guard let data = data else {
				DispatchQueue.main.async {
					result(.failure(.unableToParseData))
				}
				return
			}
			
			do {
				let decoder = JSONDecoder()
				decoder.dateDecodingStrategy = .custom { decoder -> Date in
					return try CustomDateFormatter.shared.decodeDate(from: decoder)
				}
				let model = try decoder.decode(T.self, from: data)
				DispatchQueue.main.async {
					result(.success(model))
				}
			} catch {
				print(error)
				DispatchQueue.main.async {
					result(.failure(.unableToParseData))
				}
			}
		}.resume()
	}
	
}
