//
//  LaunchLinkView.swift
//
//  Created by Talha on 1.04.2023.
//

import UIKit
import SnapKit

final class LaunchLinkView: UIView {
	// MARK: - Public Properties
	var title: String? {
		didSet {
			titleLabel.text = title
		}
	}
	
	var icon: UIImage? {
		didSet {
			iconImageView.image = icon
		}
	}
	
	// MARK: - Private Properties
	private let titleLabel = UILabel()
	private let iconImageView = UIImageView()
	private let rightDisclosure = UIImageView()
	
	// MARK: - Init
	init(title: String = "", icon: UIImage = UIImage()) {
		self.title = title
		self.icon = icon
		super.init(frame: .zero)
		setupViews()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		setupViews()
	}
	
	// MARK: - Private Methods
	private func setupViews() {
		setupBaseView()
		setupIconImageView()
		setupTitleLabel()
		setupRightDisclosure()
	}
	
	private func setupBaseView() {
		backgroundColor = .clear
		layer.cornerRadius = 8
		layer.borderWidth = 1
		layer.borderColor = UIColor.ViewColor.cgColor
		clipsToBounds = true
	}
	
	private func setupIconImageView() {
		iconImageView.contentMode = .scaleAspectFit
		addSubview(iconImageView)
		iconImageView.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(16)
			$0.leading.equalToSuperview().inset(16)
			$0.height.width.equalTo(32)
		}
	}
	
	private func setupTitleLabel() {
		titleLabel.textColor = UIColor.titleLabel
		titleLabel.font = UIFont.semiboldFont(size: 14)
		titleLabel.numberOfLines = 0
		titleLabel.textAlignment = .left
		addSubview(titleLabel)
		titleLabel.snp.makeConstraints {
			$0.top.bottom.equalToSuperview().inset(16)
			$0.leading.equalTo(iconImageView.snp.trailing).inset(-16)
		}
	}
	
	private func setupRightDisclosure() {
		rightDisclosure.image = UIImage(named: "right")
		rightDisclosure.contentMode = .scaleAspectFit
		addSubview(rightDisclosure)
		rightDisclosure.snp.makeConstraints {
			$0.centerY.equalToSuperview()
			$0.trailing.equalToSuperview().inset(16)
		}
	}
}

