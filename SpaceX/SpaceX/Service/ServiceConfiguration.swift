//
//  ServiceConfiguration.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

internal protocol ServiceConfiguration {
	var urlString: String { get }
	var method: HTTPMethod { get }
	var endPoint: String { get }
}

enum HTTPMethod: String {
	case get = "GET"
	case post = "POST"
}
