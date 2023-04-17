//
//  DetailBuilder.swift
//
//  Created by Talha on 2.04.2023.
//

import Foundation

final class DetailBuilder {
	static func make(launchID: String) -> DetailViewController {
		let service = APIService()
		let viewModel = DetailViewModel(launchID: launchID, model: RocketDetailModels(), service: service)
		let controller = DetailViewController(viewModel: viewModel)
		return controller
	}
}
