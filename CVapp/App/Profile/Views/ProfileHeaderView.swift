import UIKit

class ProfileHeaderView: UIView {
	
	// MARK: Private Properties
	
	private lazy var imageView = UIImageView()
	private lazy var verticalStackView = UIStackView()
	lazy var profileMainHeaderView = ProfileMainHeaderView()
	
	// MARK: Public Properties
	
	lazy var locationLabel = UILabel()
	lazy var summaryLabel = UILabel()
	
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
		setUpVerticalStackView()
		setUpMainHeaderView()
		setUpLocationLabel()
		setUpSummaryLabel()
	}
	
	private func setUpVerticalStackView() {
		addSubview(verticalStackView)
		verticalStackView.axis = .vertical
		verticalStackView.distribution = .fill
		verticalStackView.alignment = .leading
		verticalStackView.spacing = Constants.Margin.regular
		verticalStackView.translatesAutoresizingMaskIntoConstraints = false
		let constraints: [NSLayoutConstraint] = [
			verticalStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
			verticalStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
			verticalStackView.topAnchor.constraint(equalTo: topAnchor, constant: Constants.Margin.regular),
			verticalStackView.bottomAnchor.constraint(equalTo: bottomAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
	
	private func setUpMainHeaderView() {
		verticalStackView.addArrangedSubview(profileMainHeaderView)
		profileMainHeaderView.translatesAutoresizingMaskIntoConstraints = false
		let constraint = profileMainHeaderView.heightAnchor.constraint(equalToConstant: 80)
		NSLayoutConstraint.activate([constraint])
	}
	
	private func setUpSummaryLabel() {
		verticalStackView.addArrangedSubview(summaryLabel)
		summaryLabel.font = .systemFont(ofSize: 13)
		summaryLabel.textColor = Colors.subHeader
		summaryLabel.numberOfLines = 0
	}
	
	private func setUpLocationLabel() {
		verticalStackView.addArrangedSubview(locationLabel)
		locationLabel.font = .monospacedDigitSystemFont(ofSize: 13, weight: .light)
		locationLabel.textColor = Colors.lightGray
	}
}
