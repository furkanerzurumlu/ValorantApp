//
//  WeaponsSkins.swift
//  ValorantApp
//
//  Created by Furkan Erzurumlu on 17.07.2022.
//

import Foundation
// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weaponsSkins = try? newJSONDecoder().decode(WeaponsSkins.self, from: jsonData)

import Foundation

// MARK: - WeaponsSkins
struct WeaponsSkins: Codable {
    let status: Int
    let data: [DAtum]
}

// MARK: - Datum
struct DAtum: Codable {
    let uuid, displayName, themeUUID: String
    let contentTierUUID: String?
    let displayIcon, wallpaper: String?
    let assetPath: String
    let chromas: [CHROMA]
    let levels: [LEVEL]

    enum CodingKeys: String, CodingKey {
        case uuid, displayName
        case themeUUID = "themeUuid"
        case contentTierUUID = "contentTierUuid"
        case displayIcon, wallpaper, assetPath, chromas, levels
    }
}

// MARK: - Chroma
struct CHROMA: Codable {
    let uuid, displayName: String
    let displayIcon: String?
    let fullRender: String
    let swatch: String?
    let streamedVideo: String?
    let assetPath: String
}

// MARK: - Level
struct LEVEL: Codable {
    let uuid: String
    let displayName: String?
    let levelItem: LEVELITEM?
    let displayIcon: String?
    let streamedVideo: String?
    let assetPath: String
}

enum LEVELITEM: String, Codable {
    case eEquippableSkinLevelItemAnimation = "EEquippableSkinLevelItem::Animation"
    case eEquippableSkinLevelItemFinisher = "EEquippableSkinLevelItem::Finisher"
    case eEquippableSkinLevelItemFishAnimation = "EEquippableSkinLevelItem::FishAnimation"
    case eEquippableSkinLevelItemHeartbeatAndMapSensor = "EEquippableSkinLevelItem::HeartbeatAndMapSensor"
    case eEquippableSkinLevelItemInspectAndKill = "EEquippableSkinLevelItem::InspectAndKill"
    case eEquippableSkinLevelItemKillBanner = "EEquippableSkinLevelItem::KillBanner"
    case eEquippableSkinLevelItemKillCounter = "EEquippableSkinLevelItem::KillCounter"
    case eEquippableSkinLevelItemKillEffect = "EEquippableSkinLevelItem::KillEffect"
    case eEquippableSkinLevelItemRandomizer = "EEquippableSkinLevelItem::Randomizer"
    case eEquippableSkinLevelItemTopFrag = "EEquippableSkinLevelItem::TopFrag"
    case eEquippableSkinLevelItemVFX = "EEquippableSkinLevelItem::VFX"
    case eEquippableSkinLevelItemVoiceover = "EEquippableSkinLevelItem::Voiceover"
}
