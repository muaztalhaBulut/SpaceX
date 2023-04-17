//
//  LaunchViewModel.swift
//
//  Created by Talha on 31.03.2023.
//

import Foundation

protocol LaunchViewModelProtocol {
	func getData(route: APIRouter)
	func routDetail()
	func setDelegate(output: LaunchOutput)
	func changeLoading()
	func switchData(at index: Int)
}

final class LaunchViewModel: LaunchViewModelProtocol {
	// MARK: -> init dependency
	private let router: LaunchRouterProtocol
	private let launchService: APIServiceProtocol
	private weak var output: LaunchOutput?
	
	// MARK: -> defined model
	private lazy var launchResult: [LaunchModels] = []
	
	// MARK: -> other definitions
	private lazy var isLoading = false
	
	// MARK: -> Designated init
	init(router: LaunchRouterProtocol, launchService: APIServiceProtocol) {
		self.router = router
		self.launchService = launchService
	}
	
	 func changeLoading() {
		isLoading = !isLoading
		DispatchQueue.main.async {
			self.output?.changeLoading(isLoad: self.isLoading)
		}
	}
	
	 func setDelegate(output: LaunchOutput) {
		self.output = output
	}
	
	func getData(route: APIRouter) {
		launchService.request(route: route) { [weak self] (result: Result<[LaunchModels], ServiceError>) in
			self?.changeLoading()
			guard let self = self else { return }
			switch result {
			case .success(let response):
				self.launchResult = response
				self.output?.saveDatas(values: self.launchResult)
				#if DEBUG
				print(response)
				#endif
			case .failure(let error):
				SnackHelper.showSnack(message: error.localizedDescription)
			}
			self.output?.changeLoading(isLoad: false)
		}
	}

	func switchData(at index: Int) {
		self.launchResult = []
		self.changeLoading()
		let route: APIRouter
		switch index {
		case 0:
			route = .upcomingLaunches
		case 1:
			route = .pastLaunches
		default:
			route = .upcomingLaunches
		}
		getData(route: route)
	}

	
	func routDetail() {
		self.router.navigateDetail()
	}
}
