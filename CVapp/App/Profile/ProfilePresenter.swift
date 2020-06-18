import Foundation

protocol ProfilePresenting {
	func configureView(_ view: ProfileView, with profile: Profile)
}

class ProfilePresenter: ProfilePresenting {
	
	// MARK: Public API
	
	func configureView(_ view: ProfileView, with profile: Profile) {
		if let url = URL(string: profile.basics.imageUrlString) {
			view.mainHeaderView.imageView.load(url: url)
		}
		view.mainHeaderView.nameLabel.text = "\(profile.basics.firstName) \(profile.basics.sureName)"
		view.mainHeaderView.roleLabel.text = profile.basics.role
		view.summaryLabel.text = profile.basics.summary
		view.locationLabel.text = "Warszawa, Polska" // TODO: implement
	}
}
