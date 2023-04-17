//
//  DetailViewController.swift
//
//  Created by Talha on 1.04.2023.
//

import UIKit
import SnapKit
import Kingfisher

protocol DetailOutput: AnyObject {
	func saveDatas(values: [RocketDetailModels])
}

final class DetailViewController: UIViewController {
	private var viewModel: DetailViewModel!
	private lazy var results: [RocketDetailModels] = []
	
	// MARK: -> Properties
	private lazy var rocketView = RocketInfoView()
	private lazy var launchDateView = LaunchDateView()
	private lazy var launchDetailView = LaunchDetailView()
	private lazy var commonStackView = UIStackView()
	
	private lazy var youtubeLinkView = LaunchLinkView()
	private lazy var presskitLinkView = LaunchLinkView()
	private lazy var linkStackView = UIStackView()
	
	
	private lazy var hours: Int = 0
	private lazy var mins: Int = 0
	private lazy var secs: Int = 0
	
	init(viewModel: DetailViewModel!) {
		super.init(nibName: nil, bundle: nil)
		self.viewModel = viewModel
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.viewModel.setDelegate(output: self) // applied delegates method from viewModel
		self.getViews()
		self.viewModel.getDetailData(id: self.viewModel.id ?? "") // Fetch the new data when initializing
		configure(with: self.viewModel) // received data is processed
		addYoutubeLinkGestureRecognizer()
		
		let dateUnix = (self.viewModel.model.dateUTC)
		let date = Date(timeIntervalSince1970: Double(dateUnix) ?? 0)
		self.callTimer(for: date)
	}
	
	func addYoutubeLinkGestureRecognizer() {
		let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.openYoutubeLink))
		youtubeLinkView.isUserInteractionEnabled = true
		youtubeLinkView.addGestureRecognizer(tapGestureRecognizer)
	}
	
	@objc private func openYoutubeLink() {
		if let youtubeID = viewModel.model.links.youtubeID, let youtubeLink = URL(string: "https://www.youtube.com/watch?v=\(youtubeID)") {
			GeneralHelper.open(link: youtubeLink)
		}
	}
	
	private func getViews() {
		title = ViewControllerTitle.detail.rawValue
		view.backgroundColor = .white
		
		view.addSubview(rocketView)
		view.addSubview(launchDateView)
		view.addSubview(launchDetailView)
		view.addSubview(commonStackView)
		view.addSubview(linkStackView)
		
		linkStackView.addArrangedSubview(youtubeLinkView)
		linkStackView.addArrangedSubview(presskitLinkView)
		linkStackView.axis = .vertical
		linkStackView.alignment = .fill
		linkStackView.distribution = .fillEqually
		linkStackView.spacing = 20
		
		youtubeLinkView.icon = UIImage(named: "youtube")
		youtubeLinkView.title = "Youtube"
		
		presskitLinkView.icon = UIImage(named: "presskit")
		presskitLinkView.title = "Presskit"
		
		presskitLinkView.isHidden = false
		youtubeLinkView.isHidden = false
		
		rocketView.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
			$0.leading.trailing.equalToSuperview().inset(20)
			$0.height.equalTo(44)
		}
		
		launchDateView.snp.makeConstraints {
			$0.top.equalTo(rocketView.snp.bottom).inset(-20)
			$0.leading.trailing.equalToSuperview().inset(20)
			$0.height.equalTo(68)
		}
		
		launchDetailView.snp.makeConstraints {
			$0.top.equalTo(launchDateView.snp.bottom).inset(-20)
			$0.leading.trailing.equalToSuperview().inset(20)
			$0.height.equalTo(216)
		}
		
		youtubeLinkView.snp.makeConstraints {
			$0.height.equalTo(64)
		}
		
		linkStackView.snp.makeConstraints {
			$0.top.equalTo(launchDetailView.snp.bottom).inset(-20)
			$0.leading.trailing.equalToSuperview().inset(20)
		}
	}
	
	private func callTimer(for date: Date) {
		let difference = floor(date.timeIntervalSince(Date()))
		if difference > 0.0 {
			
			let hours: Int = Int(difference) / 3600
			let shortMinute: Int = Int(difference) - (hours * 3600)
			let minutes: Int = shortMinute / 60
			let seconds: Int = Int(difference) - (hours * 3600) - (minutes * 60)
			
			self.hours = hours
			self.mins = minutes
			self.secs = seconds
			
			launchDateView.hour = "\(hours)"
			launchDateView.min = "\(minutes)"
			launchDateView.sec = "\(seconds)"
			
			updateLabel()
			startTimer()
		}
	}
	
	private func startTimer() {
		
		Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { _ in
			if self.secs > 0 {
				self.secs = self.secs - 1
				
			} else if self.mins > 0 && self.secs == 0 {
				self.mins = self.mins - 1
				self.secs = 59
				
			} else if self.hours > 0 && self.mins == 0 && self.secs == 0 {
				self.hours = self.hours - 1
				self.secs = 59
				self.mins = 59
			}
			
			self.updateLabel()
		}
	}
	
	private func updateLabel() {
		self.launchDateView.hour = "\(hours)"
		self.launchDateView.min = "\(mins)"
		self.launchDateView.sec = "\(secs)"
	}
	
	private func configure(with viewModel: DetailViewModelProtocol) {
		viewModel.updateViewData { [weak self] viewData in
			self?.launchDateView.date = viewData.launchDate
			self?.rocketView.icon = viewData.rocketIcon
			self?.rocketView.title = viewData.rocketTitle
			self?.launchDetailView.upcoming = "\(viewData.upcoming)"
			self?.launchDetailView.flightNumber = "\(viewData.flightNumber)"
			self?.launchDetailView.datePrecision = "\(viewData.datePrecision)"
			self?.launchDetailView.landingType = viewData.landingType
			self?.launchDetailView.landingAttempt = "\(viewData.landingAttempt)"
			self?.launchDetailView.landingSuccess = "\(viewData.landingSuccess)"
		}
	}
	
}

extension DetailViewController: DetailOutput {
	func saveDatas(values: [RocketDetailModels]) {
		self.results = values
		configure(with: self.viewModel)
	}
}

