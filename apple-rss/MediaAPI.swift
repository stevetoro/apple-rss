//
//  MediaAPI.swift
//  apple-rss
//
//  Created by Steve Toro on 9/2/19.
//  Copyright © 2019 Steve Toro. All rights reserved.
//

import Foundation

struct MediaAPI {
    static func getMediaTypes() -> [[String:String]] {
        let MediaTypes = [
            ["name": "Apple Music", "path": "apple-music/hot-tracks/all/25/explicit.json"],
            ["name": "iTunes Music", "path": "itunes-music/hot-tracks/all/25/explicit.json"],
            ["name": "iOS Apps", "path": "ios-apps/new-apps-we-love/all/25/explicit.json"],
            ["name": "Audiobooks", "path": "audiobooks/top-audiobooks/all/25/explicit.json"],
            ["name": "Books", "path": "books/top-free/all/25/explicit.json"],
            ["name": "TV Shows", "path": "tv-shows/top-tv-episodes/all/25/explicit.json"],
            ["name": "Movies", "path": "movies/top-movies/all/25/explicit.json"],
            ["name": "iTunes U", "path": "itunes-u/top-itunes-u-courses/all/25/explicit.json"],
            ["name": "Podcasts", "path": "podcasts/top-podcasts/all/25/explicit.json"],
            ["name": "Music Videos", "path": "music-videos/top-music-videos/all/25/explicit.json"]
        ]
        return MediaTypes
    }
}
