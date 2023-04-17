//
//  LaunchRouter.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

protocol LaunchRouterProtocol {
	func navigateDetail()
}

final class LaunchRouter: LaunchRouterProtocol {
	weak var view: LaunchViewController?
	
	func navigateDetail() {
		view?.navigationController?.pushViewController(DetailViewController(viewModel: DetailViewModel(launchID: "", model: RocketDetailModels(), service: APIService.shared)), animated: true)
	}

}
