//
//  UITableView+Ext.swift
//
//  Created by Talha on 31.03.2023.
//

import UIKit

extension UITableView {
	
  func register<T: UITableViewCell>(cellType: T.Type) {
	register(cellType.self, forCellReuseIdentifier: cellType.reuseIdentifier)
  }
  
  func dequeueReusableCell<T: UITableViewCell>(for indexPath: IndexPath, cellType: T.Type = T.self) -> T {
	guard let cell = dequeueReusableCell(withIdentifier: cellType.reuseIdentifier, for: indexPath) as? T else {
	  fatalError(
		"Failed to dequeue a cell with identifier \(cellType.reuseIdentifier) matching type \(cellType.self). "
		+ "Check that the reuseIdentifier is set properly in your XIB/Storyboard and that you registered the cell beforehand."
	  )
	}
	return cell
  }
}
