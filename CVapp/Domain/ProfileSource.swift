
protocol ProfileSourcing {
	func getProfile(id: String, onSuccess: @escaping (Profile) -> Void, onError: @escaping (Error) -> Void)
}

class ProfileSource: ProfileSourcing {
	
	// MARK: Dependencies
	
	private let profileFetcher: ProfileFetching
	
	// MARK: Initializers
	
	init(profileFetcher: ProfileFetching) {
		self.profileFetcher = profileFetcher
	}
	
	// MARK: Public API
	
	func getProfile(id: String, onSuccess: @escaping (Profile) -> Void, onError: @escaping (Error) -> Void) {
		profileFetcher.fetchProfile(id: id, onSuccess: onSuccess, onError: onError)
	}
}
