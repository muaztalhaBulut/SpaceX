//
//  LaunchBuilder.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

final class LaunchBuilder {
	static func make() -> LaunchViewController {
		let router = LaunchRouter()
		let service = APIService()
		let viewModel = LaunchViewModel(router: router, launchService: service)
		let controller = LaunchViewController(viewModel: viewModel)
		router.view = controller
		return controller
	}
}
