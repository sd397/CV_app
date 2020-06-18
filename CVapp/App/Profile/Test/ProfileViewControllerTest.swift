import XCTest
@testable import CVapp

final class ProfileViewControllerTest: XCTestCase {
	
	var sut: ProfileViewController!
	var profileSourceMock: ProfileSourceMock!
	var profilePresenterMock: ProfilePresenterMock!
	
	override func setUp() {
        super.setUp()
		profileSourceMock = ProfileSourceMock()
		profilePresenterMock = ProfilePresenterMock()
        sut = ProfileViewController(profileSource: profileSourceMock, profilePresenter: profilePresenterMock)
	}
	
    override func tearDown() {
		profilePresenterMock = nil
		profileSourceMock = nil
		sut = nil
    }
	
	func testGetProfilesCalled() {
		sut.viewDidLoad()
		XCTAssertTrue(profileSourceMock.getProfileCalled)
	}
	
	func testWhenSourceReturnsSuccess() {
		profileSourceMock.onSuccessReturnValue = .stub
		sut.viewDidLoad()
		
		XCTAssertTrue(profileSourceMock.getProfileCalled)
		XCTAssertEqual(profilePresenterMock.configureViewPassedProfile, Profile.stub)
	}
	
	func testWhenSourceReturnsError() {
		profileSourceMock.onErrorReturnValue = TestError()
		sut.viewDidLoad()
		
		XCTAssertTrue(profileSourceMock.getProfileCalled)
		XCTAssertFalse(profilePresenterMock.configueViewCalled)
	}
}

struct TestError: Error {}
