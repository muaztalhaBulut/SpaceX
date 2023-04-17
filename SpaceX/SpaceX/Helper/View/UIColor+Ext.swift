//
//  UIColor+Ext.swift
//
//  Created by Talha on 31.03.2023.
//

import UIKit

extension UIColor {
	
	// MARK: - Background
	@nonobjc public class var LaunchBackground: UIColor {
		return UIColor(r: 255, g: 255, b: 255)
	}
	// MARK: - Segment Background
	@nonobjc public class var SegmentBackground: UIColor {
		return UIColor(r: 255, g: 255, b: 255)
	}
	// MARK: - Selected Label Segment Background
	@nonobjc public class var SelectedLabelBackground: UIColor {
		return UIColor(r: 023, g: 027, b: 056)
	}
	// MARK: -  NOT Selected Segment Background
	@nonobjc public class var NotSelectedSegmentBackground: UIColor {
		return UIColor(r: 243, g: 244, b: 250)
	}
	// MARK: -  ViewColor
	@nonobjc public class var ViewColor: UIColor {
		return UIColor(r: 243, g: 244, b: 250)
	}
	// MARK: -  Detail Title Label
	@nonobjc public class var titleLabel: UIColor {
		return UIColor(r: 024, g: 027, b: 054)
	}
	// MARK: -  Detail Subtitle Label
	@nonobjc public class var SubtitleLabel: UIColor {
		return UIColor(r: 129, g: 133, b: 164)
	}
	// MARK: -  Border Color
	@nonobjc public class var Border: UIColor {
		return UIColor(r: 243, g: 244, b: 250)
	}
   
	convenience init(r: CGFloat, g: CGFloat, b: CGFloat, alpha: CGFloat = 1.0) {
		self.init(red: r / 255, green: g / 255, blue: b / 255, alpha: alpha)
	}
}
