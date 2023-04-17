//
//  Date+Ext.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

extension Date {
  func convertToLaunchDetailFormat() -> String {
	let dateFormatter = DateFormatter()
	dateFormatter.dateFormat = "yyyy.MM.dd"
	return dateFormatter.string(from: self)
  }
  
  func convertToLaunchFormat() -> String {
	let dateFormatter = DateFormatter()
	dateFormatter.dateFormat = "yyyy-MM-dd - HH:mm"
	return dateFormatter.string(from: self)
  }
}
