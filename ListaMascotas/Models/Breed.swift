import Foundation

struct Breed: Codable {
    let id: Int
    let name: String
    let pets: [Pet]
}
