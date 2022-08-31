//
//  FeedModel.swift
//  InstagramUI
//
//  Created by Admin on 30/08/22.
//

import Foundation

// MARK: - FeedModel
struct FeedModel: Codable {
    let hightlights: [Hightlight]
    let feed: [Feed]
}

// MARK: - Feed
struct Feed: Codable,Identifiable {
    let id: Int
    let username, caption: String
    let imageurl: String
    let location:String
}
