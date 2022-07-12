//
//  Maps.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 12.07.2022.
//

import Foundation

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let maps = try? newJSONDecoder().decode(Maps.self, from: jsonData)

import Foundation

// MARK: - Maps
struct Maps: Codable {
    let status: Int
    let data: [Datums]
}

// MARK: - Datum
struct Datums: Codable {
    let uuid, displayName, coordinates: String
    let displayIcon: String?
    let listViewIcon, splash: String
    let assetPath, mapURL: String
    let xMultiplier, yMultiplier, xScalarToAdd, yScalarToAdd: Double
    let callouts: [Callout]?

    enum CodingKeys: String, CodingKey {
        case uuid, displayName, coordinates, displayIcon, listViewIcon, splash, assetPath
        case mapURL = "mapUrl"
        case xMultiplier, yMultiplier, xScalarToAdd, yScalarToAdd, callouts
    }
}

// MARK: - Callout
struct Callout: Codable {
    let regionName: String
    let superRegionName: SuperRegionName
    let location: Location
}

// MARK: - Location
struct Location: Codable {
    let x, y: Double
}

enum SuperRegionName: String, Codable {
    case a = "A"
    case attackerSide = "Attacker Side"
    case b = "B"
    case c = "C"
    case defenderSide = "Defender Side"
    case mid = "Mid"
}
