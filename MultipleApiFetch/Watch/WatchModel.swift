//
//  WatchModel.swift
//  MultipleApiFetch
//
//  Created by Admin on 11/03/23.
//
import Foundation

// MARK: - WatchModelElement
struct WatchModelElement: Codable {
    let gender: String
    let data: [Datum]

    enum CodingKeys: String, CodingKey {
        case gender = "gender"
        case data = "data"
    }
}

// MARK: - Datum
struct Datum: Codable {
    let id: Int
    let title: String
    let price: Int
    let thumbnail: String
    let images: [String]

    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case price = "price"
        case thumbnail = "thumbnail"
        case images = "images"
    }
}

