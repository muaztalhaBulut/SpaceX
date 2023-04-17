//
//  LaunchDetailModel.swift
//  MobilliumSpaceX-CodeChallenge
//
//  Created by Talha on 31.03.2023.
//

import Foundation

struct DetailResponseModel: Codable {
	let results: [RocketDetailModels]?
}

struct RocketDetailModels: Codable {
	let links: RocketDetailLink
	let flightNumber: Int
	let name: String
	let dateUTC: String
	let dateLocal: String
	let dateUnix: Int
	let datePrecision: RocketDetailDatePrecision
	let upcoming: Bool
	let cores: [RocketDetailCore]
	let id: String

	enum CodingKeys: String, CodingKey {
		case links
		case flightNumber = "flight_number"
		case name
		case dateUTC = "date_utc"
		case dateLocal = "date_local"
		case dateUnix = "date_unix"
		case datePrecision = "date_precision"
		case upcoming
		case cores
		case id
	}

	init() {
		links = RocketDetailLink(patch: RocketDetailPatch(small: nil), presskit: nil, webcast: nil, youtubeID: nil, article: nil, wikipedia: nil)
		flightNumber = 0
		name = ""
		dateUTC = ""
		dateLocal = ""
		dateUnix = 0
		datePrecision = .day
		upcoming = false
		cores = []
		id = ""
	}
}


// MARK: - Links

struct RocketDetailLink: Codable {
  let patch: RocketDetailPatch
  let presskit: String?
  let webcast: String?
  let youtubeID: String?
  let article: String?
  let wikipedia: String?
  
  enum CodingKeys: String, CodingKey {
	case patch
	case presskit
	case webcast
	case youtubeID = "youtube_id"
	case article
	case wikipedia
  }
}

// MARK: - Patch

struct RocketDetailPatch: Codable {
  let small: String?
  
  enum CodingKeys: String, CodingKey {
	case small = "small"
  }
}

enum RocketDetailDatePrecision: String, Codable {
	case day = "day"
	case hour = "hour"
	case month = "month"
}

// MARK: - Cores

struct RocketDetailCore: Codable {
  let landingAttempt: Bool?
  let landingSuccess: Bool?
  let landingType: RocketLandingType?
  
  enum CodingKeys: String, CodingKey {
	case landingAttempt = "landing_attempt"
	case landingSuccess = "landing_success"
	case landingType = "landing_type"
  }
}

enum RocketLandingType: String, Codable {
	case asds = "ASDS"
	case ocean = "Ocean"
	case rtls = "RTLS"
}
