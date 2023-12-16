//
//  Song.swift
//  SongSearch
//
//  Created by Breea Toomey on 12/16/23.
//

import Foundation

struct SongResponse: Decodable {
    let hits: [Song]
}

struct Song: Decodable {
    let result: Result
}

struct Result: Decodable {
    let api_path: String
    let artist_names: String
    let full_title: String
    let song_art_image_url: String
    let id: Int
}
