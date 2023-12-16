//
//  Lyrics.swift
//  SongSearch
//
//  Created by Breea Toomey on 12/16/23.
//

import Foundation

struct LyricResponse: Decodable {
    let lyrics: Lyrics
}

struct Lyrics: Decodable {
    let lyrics: LyricInfo
}

struct LyricInfo: Decodable {
    let body: Body
}

struct Body: Decodable {
    let plain: String
}
