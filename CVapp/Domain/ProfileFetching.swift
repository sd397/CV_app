protocol ProfileFetching {
	func fetchProfile(id: String, onSuccess: @escaping (Profile) -> Void, onError: @escaping (Error) -> Void)
}
