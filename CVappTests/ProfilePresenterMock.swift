@testable import CVapp

final class ProfilePresenterMock: ProfilePresenting {
	
	var configureViewCallsCount = 0
	var configueViewCalled = false
	var configureViewPassedProfile: Profile?
	
	func configureView(_ view: ProfileView, with profile: Profile) {
		configureViewCallsCount += 1
		configueViewCalled = true
		configureViewPassedProfile = profile
	}
}
