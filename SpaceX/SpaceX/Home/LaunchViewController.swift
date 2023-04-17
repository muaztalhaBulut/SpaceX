//
//  LaunchViewController.swift
//
//  Created by Talha on 30.03.2023.
//

import UIKit
import SnapKit

protocol LaunchOutput: AnyObject {
	func changeLoading(isLoad: Bool)
	func saveDatas(values: [LaunchModels])
}

final class LaunchViewController: UIViewController {
	
	// MARK: -> Properties
	private let viewModel: LaunchViewModelProtocol
	private lazy var results: [LaunchModels] = []
	
	// MARK: -> define uı object
	private lazy var refreshControl = UIRefreshControl()
	private lazy var segmentedControl = UISegmentedControl()
	private lazy var tableView = UITableView()
	
	
	init(viewModel: LaunchViewModelProtocol) {
		self.viewModel = viewModel
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
		view.backgroundColor = .white
		title = ViewControllerTitle.home.rawValue
		getViews()
		viewModel.setDelegate(output: self) // applied delegates method from viewModel
		viewModel.switchData(at: 0) // initial data comes when start app
	}
	
	private func getViews() {
		/// Configure Refresh Control.
		refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
		refreshControl.addTarget(self, action: #selector(self.refresh(_:)), for: .valueChanged)
		tableView.addSubview(refreshControl)
		
		/// Configure Segmented Control.
		segmentedControl.insertSegment(withTitle: "Upcoming", at: 0, animated: true)
		segmentedControl.insertSegment(withTitle: "Past", at: 1, animated: true)
		segmentedControl.setTitleTextAttributes(
			[NSAttributedString.Key.foregroundColor: UIColor.SelectedLabelBackground], for: .selected)
		segmentedControl.setTitleTextAttributes(
			[NSAttributedString.Key.foregroundColor: UIColor.SelectedLabelBackground], for: .normal)
		segmentedControl.backgroundColor = UIColor.NotSelectedSegmentBackground
		segmentedControl.selectedSegmentTintColor = UIColor.SegmentBackground
		segmentedControl.selectedSegmentIndex = 0
		segmentedControl.addTarget(self, action: #selector(self.segmentedControlAction(_:)), for: .valueChanged)
		view.addSubview(segmentedControl)
		
		/// Configure Table View.
		tableView.register(cellType: LaunchTableViewCell.self)
		tableView.dataSource = self
		tableView.delegate = self
		tableView.separatorStyle = .none
		tableView.backgroundColor = view.backgroundColor
		view.addSubview(tableView)
		
		/// Setup Segmented Control Constraints.
		segmentedControl.snp.makeConstraints {
			$0.top.equalTo(view.safeAreaLayoutGuide.snp.top).inset(20)
			$0.leading.equalToSuperview().inset(20)
			$0.trailing.equalToSuperview().inset(20)
			$0.height.equalTo(32)
		}
		/// Setup Table View Constraints.
		tableView.snp.makeConstraints {
			$0.top.equalTo(segmentedControl.snp.bottom).inset(-20)
			$0.leading.equalToSuperview()
			$0.trailing.equalToSuperview()
			$0.bottom.equalToSuperview()
		}
	}
	
	@objc func refresh(_ sender: AnyObject) {
		self.tableView.reloadData()
		DispatchQueue.main.async {
			self.refreshControl.endRefreshing()
		}
	}
	
	@objc func segmentedControlAction(_ sender: AnyObject) {
		DispatchQueue.main.async {
			self.viewModel.switchData(at: self.segmentedControl.selectedSegmentIndex)
			self.tableView.reloadData()
		}
		
	}
}

extension LaunchViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let selectedModel = results[indexPath.row].id ?? "" // keep id
		let controller = DetailBuilder.make(launchID: selectedModel)
		self.navigationController?.pushViewController(controller, animated: true)
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 96
	}
}

extension LaunchViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return results.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(for: indexPath, cellType: LaunchTableViewCell.self)
		let items = self.results[indexPath.row]
		cell.configure(item: items)
		return cell
	}
}

extension LaunchViewController: LaunchOutput {
	func changeLoading(isLoad: Bool) {
		DispatchQueue.main.async {
			isLoad ? LoadingManager.shared.show() : LoadingManager.shared.hide()
		}
		
	}
	
	func saveDatas(values: [LaunchModels]) {
		self.results = values
		DispatchQueue.main.async {
			self.tableView.reloadData()
		}
	}
}

