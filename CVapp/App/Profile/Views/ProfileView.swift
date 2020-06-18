import UIKit

class ProfileView: UIView {
	
	private lazy var headerView = ProfileHeaderView()
	
	var mainHeaderView: ProfileMainHeaderView {
		headerView.profileMainHeaderView
	}
	
	var summaryLabel: UILabel {
		headerView.summaryLabel
	}
	
	var locationLabel: UILabel {
		headerView.locationLabel
	}
	
	// MARK: Initializers
	
	init() {
		super.init(frame: .zero)
		setUpSubviews()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Private Methods
	
	private func setUpSubviews() {
		backgroundColor = Colors.background
		setUpHeaderView()
	}
	
	private func setUpHeaderView() {
		addSubview(headerView)
		headerView.translatesAutoresizingMaskIntoConstraints = false
		let constraints: [NSLayoutConstraint] = [
			headerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: Constants.Margin.regular),
			headerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -Constants.Margin.regular),
			headerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
		]
		NSLayoutConstraint.activate(constraints)
	}
}
