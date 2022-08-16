//
//  ProfileModel.swift
//  InstagramUI
//
//  Created by Admin on 10/08/22.
//

import Foundation

// MARK: - ProfileModel
struct ProfileModel: Codable {
    let userprofile: Userprofile?
}

// MARK: - Userprofile
struct Userprofile: Codable {
    let userID, username, fullname, bio: String?
    let caption: String?
    let link: String?
    let bluetickEnable: Bool?
    let phoneNumber, emailAddress: String?
    let posts, followers, following: String?
    let hightlights: [Hightlight]?
    let isOtherProfile: Bool?
    var isFollow: Bool?
    
    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case username, fullname, bio, caption, link
        case bluetickEnable = "bluetick_enable"
        case phoneNumber, emailAddress, posts, followers, following
        case hightlights
        case isOtherProfile
        case isFollow
    }
}


// MARK: - Hightlight
struct Hightlight: Codable {
    let hightlightText, hightlightImg: String?
}
