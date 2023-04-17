//
//  LauchGridView.swift
//  MobilliumSpaceX-CodeChallenge
//
//  Created by Talha on 1.04.2023.
//

import UIKit
import SnapKit

final class LaunchDetailView: UIView {
	
	// MARK: - Public Properties
	
	var landingAttempt: String? {
		didSet {
			landingAttempts.text = landingAttempt
		}
	}
	
	var landingSuccess: String? {
		didSet {
			landingSuccesses.text = landingSuccess
		}
	}
	
	var landingType: String? {
		didSet {
			landingTypes.text = landingType
		}
	}
	
	var flightNumber: String? {
		didSet {
			flightNumbers.text = flightNumber
		}
	}
	
	var upcoming: String? {
		didSet {
			upcomings.text = upcoming
		}
	}
	
	var datePrecision: String? {
		didSet {
			datePrecisions.text = datePrecision
		}
	}
	// MARK: - Private Properties
	
	private let landingAttemptTitle = UILabel()
	private let landingAttempts = UILabel()
	
	private let landingSuccessTitle = UILabel()
	private let landingSuccesses = UILabel()
	
	private let landingTypeTitle = UILabel()
	private let landingTypes = UILabel()
	
	private let flightNumberTitle = UILabel()
	private let flightNumbers = UILabel()
	
	private let upcomingTitle = UILabel()
	private let upcomings = UILabel()
	
	private let datePrecisionTitle = UILabel()
	private let datePrecisions = UILabel()
	
	// MARK: - Init
	
	init(landingAttempt: String = "",
		 landingSuccess: String = "",
		 landingType: String = "",
		 flightNumber: String = "",
		 upcoming: String = "",
		 datePrecision: String = "") {
		self.landingAttempt = landingAttempt
		self.landingSuccess = landingSuccess
		self.landingType = landingType
		self.flightNumber = flightNumber
		self.upcoming = upcoming
		self.datePrecision = datePrecision
		super.init(frame: .zero)
		
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		commonInit()
	}
	
	// MARK: - Private Methods
	
	private func commonInit() {
		/// Configure Base View.
		self.backgroundColor = .clear
		self.layer.cornerRadius = 8
		self.layer.borderWidth = 1
		self.layer.borderColor = UIColor.Border.cgColor
		self.clipsToBounds = true
		
		/// Configure All Static Titles.
		landingAttemptTitle.text = LandingInfoTitle.landingAttemptTitle.rawValue
		landingAttemptTitle.font = UIFont.regularFont(size: 14)
		landingAttemptTitle.textColor = UIColor.SubtitleLabel
		
		landingSuccessTitle.text = LandingInfoTitle.landingSuccessTitle.rawValue
		landingSuccessTitle.font = UIFont.regularFont(size: 14)
		landingSuccessTitle.textColor = UIColor.SubtitleLabel
		
		landingTypeTitle.text = LandingInfoTitle.landingTypeTitle.rawValue
		landingTypeTitle.font = UIFont.regularFont(size: 14)
		landingTypeTitle.textColor = UIColor.SubtitleLabel
		
		flightNumberTitle.text = DetailString.number.rawValue
		flightNumberTitle.font = UIFont.regularFont(size: 14)
		flightNumberTitle.textColor = UIColor.SubtitleLabel
		
		upcomingTitle.text = DetailString.upcoming.rawValue
		upcomingTitle.font = UIFont.regularFont(size: 14)
		upcomingTitle.textColor = UIColor.SubtitleLabel
		
		datePrecisionTitle.text = DetailString.precision.rawValue
		datePrecisionTitle.font = UIFont.regularFont(size: 14)
		datePrecisionTitle.textColor = UIColor.SubtitleLabel
		
		/// Configure All Dynamic Titles.
		landingAttempts.text = "-"
		landingAttempts.font = UIFont.semiboldFont(size: 14)
		landingAttempts.textColor = UIColor.titleLabel
		
		landingSuccesses.text = "-"
		landingSuccesses.font = UIFont.semiboldFont(size: 14)
		landingSuccesses.textColor = UIColor.titleLabel
		
		landingTypes.text = "-"
		landingTypes.font = UIFont.semiboldFont(size: 14)
		landingTypes.textColor = UIColor.titleLabel
		
		flightNumbers.font = UIFont.semiboldFont(size: 14)
		flightNumbers.textColor = UIColor.titleLabel
		
		upcomings.font = UIFont.semiboldFont(size: 14)
		upcomings.textColor = UIColor.titleLabel
		
		datePrecisions.font = UIFont.semiboldFont(size: 14)
		datePrecisions.textColor = UIColor.titleLabel
		
		/// Configure All Subviews.
		let topLeftView = UIView()
		topLeftView.backgroundColor = .clear
		topLeftView.addSubview(landingAttemptTitle)
		topLeftView.addSubview(landingAttempts)
		topLeftView.layer.borderWidth = 0.5
		topLeftView.layer.borderColor = UIColor.Border.cgColor
		
		let topRightView = UIView()
		topRightView.backgroundColor = .clear
		topRightView.addSubview(landingSuccessTitle)
		topRightView.addSubview(landingSuccesses)
		topRightView.layer.borderWidth = 0.5
		topRightView.layer.borderColor = UIColor.Border.cgColor
		
		let midLeftView = UIView()
		midLeftView.backgroundColor = .clear
		midLeftView.addSubview(landingTypeTitle)
		midLeftView.addSubview(landingTypes)
		midLeftView.layer.borderWidth = 0.5
		midLeftView.layer.borderColor = UIColor.Border.cgColor
		
		let midRightView = UIView()
		midRightView.backgroundColor = .clear
		midRightView.addSubview(flightNumberTitle)
		midRightView.addSubview(flightNumbers)
		midRightView.layer.borderWidth = 0.5
		midRightView.layer.borderColor = UIColor.Border.cgColor
		
		let bottomLeftView = UIView()
		bottomLeftView.backgroundColor = .clear
		bottomLeftView.addSubview(upcomingTitle)
		bottomLeftView.addSubview(upcomings)
		bottomLeftView.layer.borderWidth = 0.5
		bottomLeftView.layer.borderColor = UIColor.Border.cgColor
		
		let bottomRightView = UIView()
		bottomRightView.backgroundColor = .clear
		bottomRightView.addSubview(datePrecisionTitle)
		bottomRightView.addSubview(datePrecisions)
		bottomRightView.layer.borderWidth = 0.5
		bottomRightView.layer.borderColor = UIColor.Border.cgColor
		
		/// Configure All Stack Views.
		let topStackView = UIStackView(arrangedSubviews: [topLeftView, topRightView])
		topStackView.axis = .horizontal
		topStackView.alignment = .fill
		topStackView.distribution = .fillEqually
		topStackView.spacing = 0
		
		let midStackView = UIStackView(arrangedSubviews: [midLeftView, midRightView])
		midStackView.axis = .horizontal
		midStackView.alignment = .fill
		midStackView.distribution = .fillEqually
		midStackView.spacing = 0
		
		let bottomStackView = UIStackView(arrangedSubviews: [bottomLeftView, bottomRightView])
		bottomStackView.axis = .horizontal
		bottomStackView.alignment = .fill
		bottomStackView.distribution = .fillEqually
		bottomStackView.spacing = 0
		
		let commonStackView = UIStackView(arrangedSubviews: [topStackView,
															 midStackView,
															 bottomStackView])
		commonStackView.axis = .vertical
		commonStackView.alignment = .fill
		commonStackView.distribution = .fillEqually
		commonStackView.spacing = 0
		addSubview(commonStackView)
		
		/// Configure All Constraints.
		landingAttemptTitle.snp.makeConstraints {
			$0.top.equalToSuperview().inset(16)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		landingAttempts.snp.makeConstraints {
			$0.top.equalTo(landingAttemptTitle.snp.bottom).inset(-4)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		landingSuccessTitle.snp.makeConstraints {
			$0.top.equalToSuperview().inset(16)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		landingSuccesses.snp.makeConstraints {
			$0.top.equalTo(landingSuccessTitle.snp.bottom).inset(-4)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		landingTypeTitle.snp.makeConstraints {
			$0.top.equalToSuperview().inset(16)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		landingTypes.snp.makeConstraints {
			$0.top.equalTo(landingTypeTitle.snp.bottom).inset(-4)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		flightNumberTitle.snp.makeConstraints {
			$0.top.equalToSuperview().inset(16)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		flightNumbers.snp.makeConstraints {
			$0.top.equalTo(flightNumberTitle.snp.bottom).inset(-4)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		upcomingTitle.snp.makeConstraints {
			$0.top.equalToSuperview().inset(16)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		upcomings.snp.makeConstraints {
			$0.top.equalTo(upcomingTitle.snp.bottom).inset(-4)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		datePrecisionTitle.snp.makeConstraints {
			$0.top.equalToSuperview().inset(16)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		datePrecisions.snp.makeConstraints {
			$0.top.equalTo(datePrecisionTitle.snp.bottom).inset(-4)
			$0.leading.trailing.equalToSuperview().inset(16)
		}
		
		commonStackView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
	}
}
