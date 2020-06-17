
class ProfileFetcherStub: ProfileFetching {
	func fetchProfile(id: String, onSuccess: @escaping (Profile) -> Void, onError: @escaping (Error) -> Void) {
		onSuccess(Profile.stub)
	}
}
