//
//  Country.swift
//  MultipleApiFetch
//
//  Created by Admin on 12/03/23.
//

import Foundation
//   let country = try? JSONDecoder().decode(Country.self, from: jsonData)

// MARK: - CountryElement
struct Country: Codable {
    let name: String
    let code: String
    let capital: String
    let region: String
    let currency: Currency
    let language: Language
    let flag: String
    let diallingCode: String
    let isoCode: String
    let demonym: String?

    enum CodingKeys: String, CodingKey {
        case name = "name"
        case code = "code"
        case capital = "capital"
        case region = "region"
        case currency = "currency"
        case language = "language"
        case flag = "flag"
        case diallingCode = "dialling_code"
        case isoCode = "isoCode"
        case demonym = "demonym"
    }
}

// MARK: - Currency
struct Currency: Codable {
    let code: String
    let name: String
    let symbol: String

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
        case symbol = "symbol"
    }
}

// MARK: - Language
struct Language: Codable {
    let code: String
    let name: String
    let iso6392: String?
    let nativeName: String?

    enum CodingKeys: String, CodingKey {
        case code = "code"
        case name = "name"
        case iso6392 = "iso639_2"
        case nativeName = "nativeName"
    }
}

