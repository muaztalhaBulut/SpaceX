//
//  DateView.swift
//  MobilliumSpaceX-CodeChallenge
//
//  Created by Talha on 1.04.2023.
//

import UIKit
import SnapKit

final class LaunchDateView: UIView {
	
	// MARK: - Public Properties
	var date: String? {
		didSet {
			launchDateLabel.text = date
		}
	}
	
	var hour: String? {
		didSet {
			hoursLabel.text = hour
		}
	}
	
	var min: String? {
		didSet {
			minutesLabel.text = min
		}
	}
	
	var sec: String? {
		didSet {
			secondsLabel.text = sec
		}
	}
	
	// MARK: - Private Properties
	
	private let launchDateTitleLabel = UILabel()
	private let launchDateLabel = UILabel()
	
	private let hoursTitleLabel = UILabel()
	private let hoursLabel = UILabel()
	
	private let hoursSeparatorLabel = UILabel()
	private let hoursEmptySeparatorLabel = UILabel()
	
	private let minutesTitleLabel = UILabel()
	private let minutesLabel = UILabel()
	
	private let minutesSeparatorLabel = UILabel()
	private let minutesEmptySeparatorLabel = UILabel()
	
	private let secondsTitleLabel = UILabel()
	private let secondsLabel = UILabel()
	
	// MARK: - Init
	
	init(date: String = "", hour: String = "", min: String = "", sec: String = "") {
		self.date = date
		self.hour = hour
		self.min = min
		self.sec = sec
		
		super.init(frame: .zero)
		
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		commonInit()
	}
	
	// MARK: - Private Methods
	
	private func commonInit() {
		backgroundColor = .black
		layer.cornerRadius = 8
		
		// Configure all labels
		let labels = [
			launchDateTitleLabel: "Launch Date",
			launchDateLabel: "2020.03.01",
			hoursLabel: "-",
			hoursTitleLabel: "Hours",
			hoursSeparatorLabel: ":",
			minutesLabel: "-",
			minutesTitleLabel: "Min",
			minutesSeparatorLabel: ":",
			secondsLabel: "-",
			secondsTitleLabel: "Sec"
		]
		
		labels.forEach { label, text in
			configure(label, with: text)
		}
		
		// Configure all stack views
		let leftTitlesStackView = UIStackView(arrangedSubviews: [launchDateTitleLabel, launchDateLabel])
		leftTitlesStackView.axis = .vertical
		leftTitlesStackView.alignment = .fill
		leftTitlesStackView.distribution = .fillEqually
		leftTitlesStackView.spacing = 4
		
		let hoursStackView = UIStackView(arrangedSubviews: [hoursLabel, hoursTitleLabel])
		hoursStackView.axis = .vertical
		hoursStackView.alignment = .fill
		hoursStackView.distribution = .fillEqually
		hoursStackView.spacing = 4
		
		let hoursSeparatorStackView = UIStackView(arrangedSubviews: [hoursSeparatorLabel, hoursEmptySeparatorLabel])
		hoursSeparatorStackView.axis = .vertical
		hoursSeparatorStackView.alignment = .fill
		hoursSeparatorStackView.distribution = .fillEqually
		hoursSeparatorStackView.spacing = 4
		
		let minutesStackView = UIStackView(arrangedSubviews: [minutesLabel, minutesTitleLabel])
		minutesStackView.axis = .vertical
		minutesStackView.alignment = .fill
		minutesStackView.distribution = .fillEqually
		minutesStackView.spacing = 4
		
		let minutesSeparatorStackView = UIStackView(arrangedSubviews: [minutesSeparatorLabel, minutesEmptySeparatorLabel])
		minutesSeparatorStackView.axis = .vertical
		minutesSeparatorStackView.alignment = .fill
		minutesSeparatorStackView.distribution = .fillEqually
		minutesSeparatorStackView.spacing = 4
		
		let secondsStackView = UIStackView(arrangedSubviews: [secondsLabel, secondsTitleLabel])
		secondsStackView.axis = .vertical
		secondsStackView.alignment = .fill
		secondsStackView.distribution = .fillEqually
		secondsStackView.spacing = 4
		
		let commonStackView = UIStackView(arrangedSubviews: [
			leftTitlesStackView,
			hoursStackView,
			hoursSeparatorStackView,
			minutesStackView,
			minutesSeparatorStackView,
			secondsStackView
		])
		commonStackView.axis = .horizontal
		commonStackView.alignment = .fill
		commonStackView.distribution = .fill
		commonStackView.spacing = 0
		
		addSubview(commonStackView)
		
		// Configure all constraints
		leftTitlesStackView.snp.makeConstraints {
			$0.width.equalTo(commonStackView.snp.width).multipliedBy(0.58)
		}
		
		hoursStackView.snp.makeConstraints {
			$0.width.equalTo(commonStackView.snp.width).multipliedBy(0.12)
		}
		
		hoursSeparatorStackView.snp.makeConstraints {
			$0.width.equalTo(commonStackView.snp.width).multipliedBy(0.05)
		}
		
		minutesStackView.snp.makeConstraints {
			$0.width.equalTo(commonStackView.snp.width).multipliedBy(0.1)
		}
		
		minutesSeparatorStackView.snp.makeConstraints {
			$0.width.equalTo(commonStackView.snp.width).multipliedBy(0.05)
		}
		
		secondsStackView.snp.makeConstraints {
			$0.width.equalTo(commonStackView.snp.width).multipliedBy(0.1)
		}
		
		commonStackView.snp.makeConstraints {
			$0.edges.equalToSuperview().inset(16)
		}
	}
	
	private func configure(_ label: UILabel, with text: String) {
		label.textColor = .white
		label.font = .systemFont(ofSize: 13, weight: .medium)
		label.numberOfLines = 0
		label.textAlignment = .left
		label.text = text
	}
}

