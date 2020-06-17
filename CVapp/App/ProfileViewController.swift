import UIKit

class ProfileViewController: UIViewController {
	
	// MARK: Dependencies
	
	private let profileSource: ProfileSource
	
	// MARK: Initializer
	
	init (profileSource: ProfileSource) {
		self.profileSource = profileSource
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	// MARK: View Lifecycle

	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
