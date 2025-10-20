import Foundation

struct Pet: Codable {
    let id: Int
    let name: String
    let type: String
    let age: Int
    let owner: String?
    let imageName: String?

    // 7 detalles adicionales
    let microchip: String?
    let vaccinated: Bool?
    let weight: Double?
    let gender: String?
    let color: String?
}
