//
//  Missions.swift
//  API
//
//  Created by DGF on 12/5/22.
//

import Foundation


struct ResponseAPI : Codable, Hashable{
    let  id = UUID()
    let name: String
    let date: String
    let rocket: Rocket
    let details: String?
    let launchSite: LaunchSite
    let launchSuccess: Bool?
    let links: Links
    let launchYear: String
    //let missionID: [String]

    enum CodingKeys: String, CodingKey {
        case id
        case name = "mission_name"
        case date = "launch_date_utc"
        case rocket
        case launchSite = "launch_site"
        case launchYear = "launch_year"
        case links, details
        case launchSuccess = "launch_success"
    

    }
}

struct Rocket : Codable, Hashable {
    
    let rocketName: RocketName
    enum CodingKeys: String, CodingKey {
        case rocketName = "rocket_name"
    }
}
enum RocketName: String, Codable {
    case falcon1 = "Falcon 1"
    case falcon9 = "Falcon 9"
    case falconHeavy = "Falcon Heavy"
}

struct Links : Codable, Hashable{
    let missionPatch, missionPatchSmall: String?
    let flickrImages: [String]?
    
    enum CodingKeys: String, CodingKey {
        case missionPatch = "mission_patch"
        case missionPatchSmall = "mission_patch_small"
        case flickrImages = "flickr_images"
    }
}

struct LaunchSite :Codable, Hashable{
    let siteName: SiteName
   
}




extension LaunchSite {
    enum CodingKeys: String, CodingKey{
        case siteName = "site_name"
    }
}
enum SiteName: String, Codable, Hashable {
    case ccafsSlc40 = "CCAFS SLC 40"
    case kscLc39A = "KSC LC 39A"
    case kwajaleinAtoll = "Kwajalein Atoll"
    case vafbSlc4E = "VAFB SLC 4E"
}
