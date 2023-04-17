//
//  General+Ext.swift
//
//  Created by Talha on 2.04.2023.
//

import UIKit

class GeneralHelper {
	static func open(link: URL) {
		if UIApplication.shared.canOpenURL(link) {
			UIApplication.shared.open(link, options: [:], completionHandler: nil)
		}
	}
}
