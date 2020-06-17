
import Foundation

struct BasicProfile: Codable {
	let firstName: String
	let sureName: String
	let role: String
	let imageUrlString: String
	let summary: String
	
	enum CodingKeys: String, CodingKey {
		case imageUrlString = "image"
		case firstName, sureName, role, summary
	}
}
