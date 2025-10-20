import Foundation

struct Species: Codable {
    let id: Int
    let name: String
    let breeds: [Breed]
}
