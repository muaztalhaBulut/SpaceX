//
//  APIError.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

enum ServiceError: Error {
	case invalidURL
	case unableToParseData
	case networkError(Error)
	case serverError(statusCode: Int)
	
	var localizedDescription: String {
		switch self {
			case .invalidURL:
				return NSLocalizedString("The URL is invalid", comment: "Service Error: Invalid URL")
			case .unableToParseData:
				return NSLocalizedString("The response data is invalid or unable to parse", comment: "Service Error: Unable to Parse Data")
			case .networkError(let error):
				return NSLocalizedString("A network error occurred: \(error.localizedDescription)", comment: "Service Error: Network Error")
			case .serverError(let statusCode):
				return NSLocalizedString("The server returned an error with status code: \(statusCode)", comment: "Service Error: Server Error")
		}
	}
}
