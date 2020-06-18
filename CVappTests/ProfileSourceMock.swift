@testable import CVapp

final class ProfileSourceMock: ProfileSourcing {
	
	var getProfileIdPassed: String? = nil
	var getProfileCalled = false
	var getProfileCallsCount = 0
	var onSuccessReturnValue: Profile?
	var onErrorReturnValue: Error?
	
	func getProfile(id: String, onSuccess: @escaping (Profile) -> Void, onError: @escaping (Error) -> Void) {
		getProfileIdPassed = id
		getProfileCallsCount += 1
		getProfileCalled = true
		if let success = onSuccessReturnValue { onSuccess(success); return }
		if let error = onErrorReturnValue { onError(error); return }
	}
}
