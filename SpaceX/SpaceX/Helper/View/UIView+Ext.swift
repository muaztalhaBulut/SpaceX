//
//  UIView+Ext.swift
//
//  Created by Talha on 31.03.2023.
//

import SnapKit

extension UIView {
	func edgesToSuperview(insets: UIEdgeInsets = UIEdgeInsets(top: 16, left: 16, bottom: 16, right: 16)) {
		guard self.superview != nil else { return }
		self.snp.makeConstraints { make in
			make.top.equalToSuperview().inset(insets.top)
			make.left.equalToSuperview().inset(insets.left)
			make.bottom.equalToSuperview().inset(insets.bottom)
			make.right.equalToSuperview().inset(insets.right)
		}
	}
}
