//
//  Media.swift
//  apple-rss
//
//  Created by Steve Toro on 9/2/19.
//  Copyright © 2019 Steve Toro. All rights reserved.
//

import Foundation

struct MediaResponse: Codable {
    var feed: RSSFeed
}

struct RSSFeed: Codable {
    var results: [ Media ]
}

struct Media: Codable {
    var name: String
    var kind: String
    var artworkUrl100: String
}
