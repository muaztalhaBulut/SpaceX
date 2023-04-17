//
//  LaunchModel.swift
//  MobilliumSpaceX-CodeChallenge
//
//  Created by Talha on 31.03.2023.
//

import Foundation

struct LaunchResponseModel: Codable {
	let results: [LaunchModels]?
}

struct LaunchModels: Codable {
  let links: LaunchLink?
  let name: String?
  let dateUTC: String?
  let dateUnix: Int?
  let dateLocal: String?
  let id: String?
  
  enum CodingKeys: String, CodingKey {
	case links
	case name
	case dateUTC = "date_utc"
	case dateLocal = "date_local"
	case dateUnix = "date_unix"
	case id
  }
}

// MARK: - Links

struct LaunchLink: Codable {
  let patch: LaunchPatch?
  
  enum CodingKeys: String, CodingKey {
	case patch
  }
}

// MARK: - Patch

struct LaunchPatch: Codable {
  let small: String?
  
  enum CodingKeys: String, CodingKey {
	case small
  }
}

//struct LaunchModels: Codable {
//	let fairings: Fairings?
//	let links: Links?
//	let staticFireDateUTC: String?
//	let staticFireDateUnix: Int?
//	let net: Bool?
//	let window: Int?
//	let rocket: String?
//	let success: Bool?
//	let failures: [Failure]?
//	let details: String?
//	let crew: [String]?
//	let ships: [String]?
//	let capsules: [String]?
//	let payloads: [String]?
//	let launchpad: String?
//	let flightNumber: Int?
//	let name: String?
//	let dateUTC: String?
//	let dateUnix: Int?
//	let dateLocal: String?
//	let datePrecision: String?
//	let upcoming: Bool?
//	let cores: [Core]?
//	let autoUpdate: Bool?
//	let tbd: Bool?
//	let launchLibraryID: String?
//	let id: String?
//
//	enum CodingKeys: String, CodingKey {
//		case fairings, links, net, window, rocket, success, failures, details, crew, ships, capsules, payloads, launchpad
//		case flightNumber = "flight_number"
//		case name, upcoming, cores, autoUpdate, tbd
//		case staticFireDateUTC = "static_fire_date_utc"
//		case staticFireDateUnix = "static_fire_date_unix"
//		case dateUTC = "date_utc"
//		case dateUnix = "date_unix"
//		case dateLocal = "date_local"
//		case datePrecision = "date_precision"
//		case launchLibraryID = "launch_library_id"
//		case id = "id"
//	}
//
//	struct Fairings: Codable {
//		let reused, recoveryAttempt, recovered: Bool?
//		let ships: [String]?
//
//		enum CodingKeys: String, CodingKey {
//			case reused
//			case recoveryAttempt = "recovery_attempt"
//			case recovered
//			case ships
//		}
//	}
//
//	struct Links: Codable {
//		let patch: Patch?
//		let reddit: Reddit?
//		let flickr: Flickr?
//		let presskit: String?
//		let webcast: String?
//		let youtubeID: String?
//		let article: String?
//		let wikipedia: String?
//	}
//
//	struct Patch: Codable {
//		let small: String?
//		let large: String?
//	}
//
//	struct Reddit: Codable {
//		let campaign: String?
//		let launch: String?
//		let media: String?
//		let recovery: String?
//	}
//
//	struct Flickr: Codable {
//		let small: [String]?
//		let original: [String]?
//	}
//
//	struct Failure: Codable {
//		let time: Int?
//		let altitude: Int?
//		let reason: String?
//	}
//
//	struct Core: Codable {
//		let core: String?
//		let flight: Int?
//		let gridfins, legs, reused: Bool?
//		let landingAttempt: Bool?
//		let landingSuccess: Bool?
//		let landingType: String?
//		let landpad: String?
//
//		enum CodingKeys: String, CodingKey {
//			case core, flight, gridfins, legs, reused
//			case landingAttempt = "landing_attempt"
//			case landingSuccess = "landing_success"
//			case landingType = "landing_type"
//			case landpad
//		}
//	}
//}
