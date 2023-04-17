//
//  DetailViewModel.swift
//  MobilliumSpaceX-CodeChallenge
//
//  Created by Talha on 1.04.2023.
//

import UIKit
import Kingfisher

protocol DetailViewModelProtocol {
	func setDelegate(output: DetailOutput)
	func updateViewData(completion: @escaping (DetailViewModel.ViewData) -> Void)
}

final class DetailViewModel: DetailViewModelProtocol {
	// MARK: Properties
	
	private var result: [RocketDetailModels] = []
	var model: RocketDetailModels
	lazy var id: String? = ""
	
	// MARK: -> init dependency
	private var landingModel: RocketDetailCore!
	private var service: APIServiceProtocol
	private weak var output: DetailOutput?
	
	private var launchID: String { // to take id from launch vc
		didSet {
			self.id = launchID
		}
	}
	
	init(launchID: String, model: RocketDetailModels, service: APIServiceProtocol) {
		self.launchID = launchID
		self.model = model
		self.service = service
	}
	
	func setDelegate(output: DetailOutput) {
		self.output = output
	}
	
	func getDetailData(id: String) {
		service.request(route: APIRouter.launchesDetail(launchID)) { [weak self] (result: Result<RocketDetailModels, ServiceError>) in
			guard let self = self else { return }
			switch result {
			case .success(let response):
				self.model = response
				self.output?.saveDatas(values: [response])
			case .failure(let error):
				SnackHelper.showSnack(message: "\(error.localizedDescription)")
			}
		}
	}
	
	func updateViewData(completion: @escaping (ViewData) -> Void) {
		let dateString = model.dateLocal.formattedString()
		let viewData = ViewData(
			rocketIcon: model.links.patch.small ?? "",
			rocketTitle: model.name,
			launchDate: dateString?.convertToLaunchFormat() ?? model.dateUTC,
			upcoming: model.upcoming,
			flightNumber: model.flightNumber,
			datePrecision: model.datePrecision.rawValue,
			landingAttempt: landingModel?.landingAttempt ?? false,
			landingSuccess: landingModel?.landingSuccess ?? false,
			landingType: landingModel?.landingType?.rawValue ?? "-",
			youtubeLink: model.links.youtubeID ?? "",
			pressLink: model.links.presskit ?? ""
		)
		DispatchQueue.main.async {
			completion(viewData)
		}
	}
	
	struct ViewData {
		let rocketIcon: String
		let rocketTitle: String
		let launchDate: String
		let upcoming: Bool
		let flightNumber: Int
		let datePrecision: String
		let landingAttempt: Bool
		let landingSuccess: Bool
		let landingType: String
		let youtubeLink: String
		let pressLink: String
	}
}
