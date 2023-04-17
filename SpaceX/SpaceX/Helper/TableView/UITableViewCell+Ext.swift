//
//  UITableViewCell+Ext.swift
//
//  Created by Talha on 31.03.2023.
//

import UIKit

protocol ReusableTableViewCell: AnyObject {
  static var reuseIdentifier: String { get }
}

extension ReusableTableViewCell {
  static var reuseIdentifier: String {
	return String(describing: self)
  }
}

extension UITableViewCell: ReusableTableViewCell { }

