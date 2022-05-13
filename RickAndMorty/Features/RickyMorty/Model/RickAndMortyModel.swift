//
//  RickAndMortyModel.swift
//  RickAndMorty
//
//  Created by Erkan Sevim on 13.05.2022.
//

// This file was generated from JSON Schema using codebeautify, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome9 = try Welcome9(json)

import Foundation

// MARK: - Welcome9
struct RickAndMortyModel: Codable {
    let info: Info?
    let results: [Result]?
}

// MARK: - Info
struct Info: Codable {
    let count, pages: Int?
    let next: String?
}

// MARK: - Result
struct Result: Codable {
    let id: Int?
    let name: String?
    let status: String?
    let species: String?
    let type: String?
    let gender: String?
    let origin, location: Location?
    let image: String?
    let episode: [String]?
    let url: String?
    let created: String?
}



// MARK: - Location
struct Location: Codable{
    let name: String?
    let url: String?
}

