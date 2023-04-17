//
//  UIFont.swift
//
//  Created by Talha on 1.04.2023.
//

import UIKit

extension UIFont {
	static func regularFont(size: CGFloat) -> UIFont {
		return UIFont.systemFont(ofSize: size, weight: .regular)
	}
	
	static func semiboldFont(size: CGFloat) -> UIFont {
		return UIFont.systemFont(ofSize: size, weight: .semibold)
	}
}
