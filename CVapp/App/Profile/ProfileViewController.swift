import UIKit

class ProfileViewController: UIViewController {
	
	// MARK: Dependencies
	
	private let profileSource: ProfileSourcing
	private let profilePresenter: ProfilePresenting
	
	// MARK: Views
	
	private lazy var profileView = ProfileView()
	
	// MARK: Initializer
	
	init (profileSource: ProfileSourcing, profilePresenter: ProfilePresenting) {
		self.profileSource = profileSource
		self.profilePresenter = profilePresenter
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: View Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
		setupProfileView()
		configureViews()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(true, animated: animated)
	}
	
	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		navigationController?.setNavigationBarHidden(false, animated: animated)
	}
	
	// MARK: Private Methods
	
	private func setupProfileView() {
		view.addSubview(profileView)
		profileView.translatesAutoresizingMaskIntoConstraints = false
		let constraints = [
			profileView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			profileView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			profileView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
			profileView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
		]
		NSLayoutConstraint.activate(constraints)
	}
	
	private func configureViews() {
		profileSource.getProfile(
			id: "1",
			onSuccess: { [unowned self] profile in
				self.profilePresenter.configureView(self.profileView, with: profile)
			},
			onError: { error in
				print("Error \(error)") // TODO: Manage error
			}
		)
	}
}
