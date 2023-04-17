//
//  LoadingManager.swift
//
//  Created by Talha on 31.03.2023.
//

import UIKit
// MARK: - Loading
protocol Loading {
	func show()
	func hide()
}
final class LoadingManager: Loading {
	static let shared = LoadingManager()
	
	private init() {}

	private enum Constants {
		static let cornerRadius: CGFloat = 8.0
		static let loadingViewWidth: CGFloat = 74.0
		static let loadingViewHeight: CGFloat = 74.0
		static let activtyIndicatorWidth: CGFloat = 66.0
		static let activtyIndicatorHeight: CGFloat = 66.0
	}

	private lazy var loadingView: UIView = {
		let view = UIView()
		view.backgroundColor = .black.withAlphaComponent(0.3)
		view.layer.cornerRadius = Constants.cornerRadius
		return view
	}()

	private lazy var activityIndicator: UIActivityIndicatorView = {
		let activityIndicator = UIActivityIndicatorView()
		activityIndicator.style = .large
		activityIndicator.color = .black
		return activityIndicator
	}()

	func show() {
		guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
		setupLoadingView(on: window)
	}

	func hide() {
		guard let window = UIApplication.shared.windows.filter({$0.isKeyWindow}).first else { return }
		loadingView.removeFromSuperview()
		window.isUserInteractionEnabled = true
	}

	private func setupLoadingView(on window: UIWindow) {
		window.addSubview(loadingView)
		loadingView.addSubview(activityIndicator)
		activityIndicator.startAnimating()
		window.bringSubviewToFront(loadingView)
		window.isUserInteractionEnabled = false

		loadingView.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview()
			make.width.equalTo(Constants.loadingViewWidth)
			make.height.equalTo(Constants.loadingViewHeight)
		}

		activityIndicator.snp.makeConstraints { make in
			make.centerX.equalToSuperview()
			make.centerY.equalToSuperview()
			make.width.equalTo(Constants.activtyIndicatorWidth)
			make.height.equalTo(Constants.activtyIndicatorHeight)
		}
	}
}
