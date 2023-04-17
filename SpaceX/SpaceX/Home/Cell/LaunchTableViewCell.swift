//
//  LaunchTableViewCell.swift
//
//  Created by Talha on 31.03.2023.
//

import UIKit
import Kingfisher
import SnapKit

final class LaunchTableViewCell: UITableViewCell {
	
	private lazy var containerView = UIView()
	private lazy var leftRocketImage = UIImageView()
	private lazy var titleLabel = UILabel()
	private lazy var subtitleLabel = UILabel()
	private lazy var rightDirection = UIImageView()
	
	// MARK: - Init
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		commonInit()
	}
	
	// MARK: - Private Methods
	private func commonInit() {
		configureBasics()
		configureContainerView()
		configureRightDisclosure()
		configureLabels()
		
		let textStackView = createTextStackView()
		containerView.addSubview(textStackView)
		
		let containerStackView = createContainerStackView(textStackView: textStackView)
		containerView.addSubview(containerStackView)
		
		setupConstraints(containerStackView: containerStackView, textStackView: textStackView)
	}
	
	private func configureBasics() {
		selectionStyle = .none
		backgroundColor = .clear
		contentView.backgroundColor = backgroundColor
	}
	
	private func configureContainerView() {
		containerView.backgroundColor = .clear
		containerView.layer.cornerRadius = 10
		containerView.layer.borderWidth = 1
		containerView.layer.borderColor = UIColor.Border.cgColor
		containerView.clipsToBounds = true
		contentView.addSubview(containerView)
	}
	
	private func configureRightDisclosure() {
		rightDirection.image = UIImage(named: "right")
		containerView.addSubview(rightDirection)
	}
	
	private func configureLabels() {
		titleLabel.font = UIFont.systemFont(ofSize: 14, weight: .semibold)
		titleLabel.textColor = UIColor.titleLabel
		
		subtitleLabel.font = UIFont.systemFont(ofSize: 12, weight: .medium)
		subtitleLabel.textColor = UIColor.SubtitleLabel
	}
	
	private func createTextStackView() -> UIStackView {
		let textStackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
		textStackView.distribution = .fillEqually
		textStackView.axis = .vertical
		textStackView.spacing = 2
		
		return textStackView
	}
	
	private func createContainerStackView(textStackView: UIStackView) -> UIStackView {
		let containerStackView = UIStackView(arrangedSubviews: [leftRocketImage, textStackView])
		containerStackView.axis = .horizontal
		containerStackView.spacing = 16
		containerStackView.alignment = .center
		
		return containerStackView
	}
	
	private func setupConstraints(containerStackView: UIStackView, textStackView: UIStackView) {
		containerView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(10).priority(999)
			$0.leading.trailing.equalToSuperview().inset(20)
		}
		
		rightDirection.snp.makeConstraints {
			$0.centerY.equalToSuperview()
			$0.trailing.equalToSuperview().inset(16)
		}
		
		leftRocketImage.snp.makeConstraints {
			$0.height.width.equalTo(44)
		}
		
		containerStackView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(16)
			$0.leading.equalToSuperview().inset(16)
			$0.trailing.equalTo(rightDirection.snp.trailing).inset(16)
		}
	}
	
	 func configure(item: LaunchModels) {
		self.titleLabel.text = item.name
		
		if let rocket = item.links?.patch?.small {
			self.leftRocketImage.kf.setImage(with: URL(string: rocket))
		} else {
			self.leftRocketImage.image = UIImage(named: "rocket")
		}
		
		let dateString = item.dateLocal?.formattedString()
		
		if let dateString = dateString {
			self.subtitleLabel.text = dateString.convertToLaunchFormat()
		} else {
			self.subtitleLabel.text = item.dateUTC
		}
	}
}
