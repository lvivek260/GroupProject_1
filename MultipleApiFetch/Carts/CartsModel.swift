import Foundation

struct CartsModel: Codable {
    let carts: [Cart]

    enum CodingKeys: String, CodingKey {
        case carts = "carts"
    }
}

struct Cart: Codable {
    let id: Int
    let products: [Products]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case products = "products"
    }
}

struct Products: Codable {
    let id: Int
    let title: String
    let price: Int
    let quantity: Int
    let total: Int
    let discountPercentage: Double
    let discountedPrice: Int

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case quantity = "quantity"
        case total = "total"
        case discountPercentage = "discountPercentage"
        case discountedPrice = "discountedPrice"
    }
}
