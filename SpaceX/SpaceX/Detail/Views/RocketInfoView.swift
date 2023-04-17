//
//  RocketInfoView.swift
//  MobilliumSpaceX-CodeChallenge
//
//  Created by Talha on 1.04.2023.
//

import UIKit
import SnapKit
import Kingfisher

final class RocketInfoView: UIView {
	
	// MARK: - Public Properties
	
	var title: String? {
		didSet {
			titleLabel.text = title
		}
	}
	
	var icon: String? {
		willSet {
			guard let iconUrl = URL(string: newValue ?? "") else { return }
			iconImageView.kf.setImage(with: iconUrl)
		}
	}
	
	// MARK: - Private Properties
	
	private let titleLabel = UILabel()
	private let iconImageView = UIImageView()
	// MARK: - Init
	
	init(title: String = "", icon: String = "") {
		self.title = title
		self.icon = icon
		
		super.init(frame: .zero)
		
		commonInit()
	}
	
	required init?(coder: NSCoder) {
		super.init(coder: coder)
		
		commonInit()
	}
	
	// MARK: - Private Methods
	
	private func commonInit() {
		backgroundColor = .clear
		
		/// Configure Icon Image.
		iconImageView.image = UIImage(named: "rocket")
		iconImageView.contentMode = .scaleAspectFit
		
		/// Configure Title Label.
		titleLabel.textColor = UIColor.titleLabel
		titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
		titleLabel.numberOfLines = 0
		titleLabel.textAlignment = .left
		
		/// Configure Content Stack View.
		let contentStackView = UIStackView(arrangedSubviews: [iconImageView, titleLabel])
		contentStackView.axis = .horizontal
		contentStackView.distribution = .fill
		contentStackView.spacing = 12
		addSubview(contentStackView)
		
		/// Configure All Constraints.
		iconImageView.snp.makeConstraints {
			$0.height.width.equalTo(44)
		}
		
		contentStackView.snp.makeConstraints {
			$0.top.bottom.leading.trailing.equalToSuperview()
		}
	}
}
