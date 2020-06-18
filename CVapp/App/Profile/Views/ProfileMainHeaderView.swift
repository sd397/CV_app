import UIKit

class ProfileMainHeaderView: UIView {
	
	// MARK: Public Properties
	
	let imageView = UIImageView()
	let nameLabel = UILabel()
	let roleLabel = UILabel()
	
	// MARK: Initializers
	
	init() {
		super.init(frame: .zero)
		setUpSubviews()
	}
	
	required init(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: Private Methods
	
	private func setUpSubviews() {
		setUpImageView()
		setUpRoleLabel()
		setUpNameLabel()
	}
	
	private func setUpImageView() {
		addSubview(imageView)
		imageView.layer.cornerRadius = Constants.Margin.tiny
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.translatesAutoresizingMaskIntoConstraints = false
		let constraints: [NSLayoutConstraint] = [
			imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			imageView.topAnchor.constraint(equalTo: topAnchor),
			imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
			imageView.widthAnchor.constraint(equalTo: heightAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
	
	private func setUpRoleLabel() {
		addSubview(roleLabel)
		roleLabel.textColor = Colors.subHeader
		roleLabel.font = .systemFont(ofSize: 15, weight: .regular)
		roleLabel.translatesAutoresizingMaskIntoConstraints = false
		roleLabel.numberOfLines = 0
		let constraints: [NSLayoutConstraint] = [
			roleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
			roleLabel.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: Constants.Margin.small),
			roleLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
	
	private func setUpNameLabel() {
		addSubview(nameLabel)
		nameLabel.textColor = Colors.mainText
		nameLabel.font = .systemFont(ofSize: 24, weight: .semibold)
		nameLabel.setContentCompressionResistancePriority(.required, for: .vertical)
		nameLabel.translatesAutoresizingMaskIntoConstraints = false
		let constraints: [NSLayoutConstraint] = [
			nameLabel.bottomAnchor.constraint(equalTo: roleLabel.topAnchor, constant: -Constants.Margin.tiny),
			nameLabel.leadingAnchor.constraint(equalTo: roleLabel.leadingAnchor),
			nameLabel.trailingAnchor.constraint(lessThanOrEqualTo: trailingAnchor),
			nameLabel.topAnchor.constraint(greaterThanOrEqualTo: topAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
}
