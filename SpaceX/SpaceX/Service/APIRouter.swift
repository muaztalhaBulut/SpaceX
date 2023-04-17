//
//  APIRouter.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

enum APIRouter: ServiceConfiguration {
	case pastLaunches
	case upcomingLaunches
	case launchesDetail(String)
	case launchesQuery
	
	private static let baseURL = "https://api.spacexdata.com/v5"
	
	/// Determine the endpoint for each case in the enumeration
	internal var endPoint: String {
		switch self {
		case .pastLaunches: return "launches/past"
		case .upcomingLaunches: return "launches/upcoming"
		case .launchesDetail(let id): return "launches/\(id)"
		case .launchesQuery: return "launches/query"
		}
	}
	
	internal var method: HTTPMethod {
		switch self {
		case .pastLaunches, .upcomingLaunches, .launchesDetail:
			return .get
		case .launchesQuery:
			return .post
		}
	}
	
	var urlString: String {
		print("LİNK: -> \(APIRouter.baseURL + "/" + endPoint)")
		return APIRouter.baseURL + "/" + endPoint
	}
}

