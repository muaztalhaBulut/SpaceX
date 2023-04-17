//
//  LaunchService.swift
//
//  Created by Talha on 1.04.2023.
//

import Foundation

struct CustomDateFormatter {
	static let shared = CustomDateFormatter()
	
	func decodeDate(from decoder: Decoder) throws -> Date {
		let container = try decoder.singleValueContainer()
		let dateString = try container.decode(String.self)
		let dateFormatter = DateFormatter()
		
		if dateString.range(of: #":\d{2}[+-]"#, options: .regularExpression) != nil {
			dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		} else {
			dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SZ"
		}
		
		guard let date = dateFormatter.date(from: dateString) else {
			throw DecodingError.dataCorruptedError(in: container, debugDescription: "Cannot decode date")
		}
		
		return date
	}
}

class LaunchService {
	let jsonDecoder: JSONDecoder = {
		let decoder = JSONDecoder()
		decoder.dateDecodingStrategy = .iso8601
		return decoder
	}()
}
