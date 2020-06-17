import XCTest
@testable import CVapp

final class ProfileMapperTest: XCTestCase {
	
	var sut: ProfileMapper!
	var dataToMap: String!
	
	override func setUp() {
        super.setUp()
        sut = ProfileMapper()
		dataToMap = """
		{
				  "basics": {
					"firstName": "Sebastien",
					"sureName": "Loeb",
					"role": "Rally Driver",
					"image": "https://upload.wikimedia.org/wikipedia/commons/4/41/Sebastien_Loeb_2014_WTCC_Race_of_Japan.jpg",
					"contact": {
					  "email": "seb@seb.com",
					  "phone": "+48666666666",
					  "website": "https://www.sebastienloeb.com",
					},
					"summary": "Born 26 February 1974 is a French professional rally, racing, and rallycross driver. He competed for the Citroën World Rally Team in the World Rally Championship (WRC) and is the most successful driver in WRC history, having won the world championship a record nine times in a row. He holds several other WRC records, including most event wins, most podium finishes and most stage wins.",
					"location": {
					  "address": "Haugenau",
					  "city": "France",
					},
				  },
				  "work": [
					{
					  "company": "Citroen",
					  "role": "Rally driver",
					  "website": "http://citroen.com",
					  "startDate": "2012-01-01",
					  "endDate": "2019-01-01",
					  "summary": "Description...",
					  "highlights": [
						"gadasdgsafs"
					  ]
					},
					{
					  "company": "Hyundai",
					  "role": "Rally driver",
					  "website": "http://citroen.com",
					  "startDate": "2019-01-01",
					  "endDate": "2020-01-01",
					  "summary": "Description...",
					  "highlights": [
						"dddasdasdasd"
					  ]
					}
				  ]
		
		}
		"""
    }
	
    override func tearDown() {
		sut = nil
		dataToMap = nil
        super.tearDown()
    }

	func testMapping() throws {
		guard let profileJson = dataToMap.data(using: .utf8) else {
			XCTFail("Cannot convert test string to json")
			return
		}
		let profile = try sut.map(json: profileJson)
		
		XCTAssertEqual(profile.basics.firstName, "Sebastien")
		XCTAssertEqual(profile.basics.sureName, "Loeb")
		XCTAssertEqual(profile.basics.role, "Rally Driver")
		XCTAssertEqual(profile.basics.imageUrlString, "https://upload.wikimedia.org/wikipedia/commons/4/41/Sebastien_Loeb_2014_WTCC_Race_of_Japan.jpg")
		XCTAssertEqual(profile.basics.summary, "Born 26 February 1974 is a French professional rally, racing, and rallycross driver. He competed for the Citroën World Rally Team in the World Rally Championship (WRC) and is the most successful driver in WRC history, having won the world championship a record nine times in a row. He holds several other WRC records, including most event wins, most podium finishes and most stage wins.")
	}
}
