// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let weapons = try? newJSONDecoder().decode(Weapons.self, from: jsonData)

import Foundation

// MARK: - Weapons
struct Weapons: Codable {
    let status: Int
    let data: [DATUM]
}

// MARK: - Datum
struct DATUM: Codable {
    let uuid, displayName, category, defaultSkinUUID: String
    let displayIcon, killStreamIcon: String
    let assetPath: String
    let weaponStats: WeaponStats?
    let shopData: ShopData?
    let skins: [Skin]

    enum CodingKeys: String, CodingKey {
        case uuid, displayName, category
        case defaultSkinUUID = "defaultSkinUuid"
        case displayIcon, killStreamIcon, assetPath, weaponStats, shopData, skins
    }
}

// MARK: - ShopData
struct ShopData: Codable {
    let cost: Int
    let category, categoryText: String
    let gridPosition: GridPosition?
    let canBeTrashed: Bool
    let image: JSONNull?
    let newImage: String
    let newImage2: JSONNull?
    let assetPath: String
}

// MARK: - GridPosition
struct GridPosition: Codable {
    let row, column: Int
}

// MARK: - Skin
struct Skin: Codable {
    let uuid, displayName, themeUUID: String
    let contentTierUUID: String?
    let displayIcon, wallpaper: String?
    let assetPath: String
    let chromas: [Chroma]
    let levels: [Level]

    enum CodingKeys: String, CodingKey {
        case uuid, displayName
        case themeUUID = "themeUuid"
        case contentTierUUID = "contentTierUuid"
        case displayIcon, wallpaper, assetPath, chromas, levels
    }
}

// MARK: - Chroma
struct Chroma: Codable {
    let uuid, displayName: String
    let displayIcon: String?
    let fullRender: String
    let swatch: String?
    let streamedVideo: String?
    let assetPath: String
}

// MARK: - Level
struct Level: Codable {
    let uuid: String
    let displayName: String?
    let levelItem: LevelItem?
    let displayIcon: String?
    let streamedVideo: String?
    let assetPath: String
}

enum LevelItem: String, Codable {
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

// MARK: - WeaponStats
struct WeaponStats: Codable {
    let fireRate: Double
    let magazineSize: Int
    let runSpeedMultiplier, equipTimeSeconds, reloadTimeSeconds, firstBulletAccuracy: Double
    let shotgunPelletCount: Int
    let wallPenetration: WallPenetration
    let feature, fireMode: String?
    let altFireType: AltFireType?
    let adsStats: AdsStats?
    let altShotgunStats: AltShotgunStats?
    let airBurstStats: AirBurstStats?
    let damageRanges: [DamageRange]
}

// MARK: - AdsStats
struct AdsStats: Codable {
    let zoomMultiplier, fireRate, runSpeedMultiplier: Double
    let burstCount: Int
    let firstBulletAccuracy: Double
}

// MARK: - AirBurstStats
struct AirBurstStats: Codable {
    let shotgunPelletCount: Int
    let burstDistance: Double
}

enum AltFireType: String, Codable {
    case eWeaponAltFireDisplayTypeADS = "EWeaponAltFireDisplayType::ADS"
    case eWeaponAltFireDisplayTypeAirBurst = "EWeaponAltFireDisplayType::AirBurst"
    case eWeaponAltFireDisplayTypeShotgun = "EWeaponAltFireDisplayType::Shotgun"
}

// MARK: - AltShotgunStats
struct AltShotgunStats: Codable {
    let shotgunPelletCount: Int
    let burstRate: Double
}

// MARK: - DamageRange
struct DamageRange: Codable {
    let rangeStartMeters, rangeEndMeters: Int
    let headDamage: Double
    let bodyDamage: Int
    let legDamage: Double
}

enum WallPenetration: String, Codable {
    case eWallPenetrationDisplayTypeHigh = "EWallPenetrationDisplayType::High"
    case eWallPenetrationDisplayTypeLow = "EWallPenetrationDisplayType::Low"
    case eWallPenetrationDisplayTypeMedium = "EWallPenetrationDisplayType::Medium"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

