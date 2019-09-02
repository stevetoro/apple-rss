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
    
    static func getMediaItems(path: String, onComplete complete: @escaping(_ data: [Media], _ error: Error?) -> Void) {
        let baseURL = "https://rss.itunes.apple.com/api/v1/us/"
        let url = URL(string: baseURL + path)!
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) {
            data, response, error in
            guard error == nil else { return complete([], error) }
            if let data = data {
                do {
                    let res = try JSONDecoder().decode(MediaResponse.self, from: data)
                    complete(res.feed.results, nil)
                } catch { complete([], error) }
            }
        }.resume()
    }
}
