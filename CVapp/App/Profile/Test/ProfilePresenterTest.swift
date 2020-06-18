import XCTest
@testable import CVapp

final class ProfilePresenterTest: XCTestCase {
	
	var sut: ProfilePresenter!
	var profileView: ProfileView!
	
	override func setUp() {
        super.setUp()
		profileView = ProfileView()
        sut = ProfilePresenter()
		sut.configureView(profileView, with: .stub)
	}
	
    override func tearDown() {
		sut = nil
        super.tearDown()
    }

	func testConfiguration() throws {
		XCTAssertEqual(profileView.mainHeaderView.nameLabel.text, "Sebastien Stub")
		XCTAssertEqual(profileView.mainHeaderView.roleLabel.text, "Driver")
		XCTAssertEqual(profileView.summaryLabel.text, "Born 26 February 1974 is a French professional rally, racing, and rallycross driver. He competed for the Citroën World Rally Team in the World Rally Championship (WRC) and is the most successful driver in WRC history, having won the world championship a record nine times in a row. He holds several other WRC records, including most event wins, most podium finishes and most stage wins.")
		XCTAssertNotEqual(profileView.mainHeaderView.imageView, nil)
	}
}
