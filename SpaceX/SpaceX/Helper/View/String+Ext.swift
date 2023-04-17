//
//  String+Ext.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

extension String {
	func formattedString() -> Date? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
		dateFormatter.timeZone = TimeZone.current
		dateFormatter.locale = Locale.current
		return dateFormatter.date(from: self)
	}
	func formattedLaunchDate(dateString: String) -> String {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSSZ"
		guard let date = dateFormatter.date(from: dateString) else {
			return dateString
		}

		dateFormatter.dateFormat = "d MMMM yyyy, HH:mm"
		let formattedDate = dateFormatter.string(from: date)
		return formattedDate
	}
}

