// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let character = try? newJSONDecoder().decode(Character.self, from: jsonData)

import Foundation

// MARK: - Character
struct Character: Codable {
    let status: Int
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let uuid, displayName, datumDescription, developerName: String
    let characterTags: [String]?
    let displayIcon, displayIconSmall: String
    let bustPortrait, fullPortrait, fullPortraitV2: String?
    let killfeedPortrait: String
    let background: String?
    let backgroundGradientColors: [String]?
    let assetPath: String
    let isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent: Bool
    let role: Role?
    let abilities: [Ability]
    let voiceLine: VoiceLine

    enum CodingKeys: String, CodingKey {
        case uuid, displayName
        case datumDescription = "description"
        case developerName, characterTags, displayIcon, displayIconSmall, bustPortrait, fullPortrait, fullPortraitV2, killfeedPortrait, background, backgroundGradientColors, assetPath, isFullPortraitRightFacing, isPlayableCharacter, isAvailableForTest, isBaseContent, role, abilities, voiceLine
    }
}

// MARK: - Ability
struct Ability: Codable {
    let slot: Slot
    let displayName, abilityDescription: String
    let displayIcon: String?

    enum CodingKeys: String, CodingKey {
        case slot, displayName
        case abilityDescription = "description"
        case displayIcon
    }
}

enum Slot: String, Codable {
    case ability1 = "Ability1"
    case ability2 = "Ability2"
    case grenade = "Grenade"
    case passive = "Passive"
    case ultimate = "Ultimate"
}

// MARK: - Role
struct Role: Codable {
    let uuid: String
    let displayName: DisplayName
    let roleDescription: String
    let displayIcon: String
    let assetPath: String

    enum CodingKeys: String, CodingKey {
        case uuid, displayName
        case roleDescription = "description"
        case displayIcon, assetPath
    }
}

enum DisplayName: String, Codable {
    case controller = "Controller"
    case duelist = "Duelist"
    case initiator = "Initiator"
    case sentinel = "Sentinel"
}

// MARK: - VoiceLine
struct VoiceLine: Codable {
    let minDuration, maxDuration: Double
    let mediaList: [MediaList]
}

// MARK: - MediaList
struct MediaList: Codable {
    let id: Int
    let wwise: String
    let wave: String
}
