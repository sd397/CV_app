import Foundation

protocol ProfileMapping {
  func map(json: Data) throws -> Profile
}

final class ProfileMapper: ProfileMapping {
  
  private let decoder: JSONDecoder = JSONDecoder()
  
  func map(json: Data) throws -> Profile {
    try decoder.decode(Profile.self, from: json)
  }
}
