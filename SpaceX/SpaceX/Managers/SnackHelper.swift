//
//  SnackHelper.swift
//
//  Created by Mehmet Salih Aslan on 31.03.2023.
//

import UIKit
import SwiftEntryKit
import SnapKit

class SnackHelper {
	class func showSnack(message: String) {
		let contentView = UIView()
		contentView.backgroundColor = .black
		
		let label = UILabel()
		label.textAlignment = .center
		label.font = .boldSystemFont(ofSize: 14)
		label.textColor = .white
		label.numberOfLines = 0
		label.text = message
		contentView.addSubview(label)
		label.edgesToSuperview()

		var attributes = EKAttributes.bottomToast
		attributes.hapticFeedbackType = .success
		attributes.positionConstraints.safeArea = .empty(fillSafeArea: true)
		let backgroundColor = EKColor(light: .white, dark: .black)
		attributes.entryBackground = .color(color: backgroundColor)

		SwiftEntryKit.display(entry: contentView, using: attributes)
	}

}

