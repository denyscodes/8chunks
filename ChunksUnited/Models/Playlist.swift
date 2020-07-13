//
//  Playlist.swift
//  ChunksUnited
//
//  Created by Denis on 7/13/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import Foundation
import Yams

struct Playlist: Decodable {
    let name: String
    let clips: [Clip]
    
    static var all: [Playlist] {
        guard let path = Bundle.main.path(forResource: "playlists", ofType: "yml") else {
            fatalError("Can't locate playlists.yml")
        }
        
        do {
            let yaml = try String(contentsOfFile: path)
            let playlists = try YAMLDecoder().decode([Playlist].self, from: yaml, userInfo: [:])
            return playlists
        } catch {
            fatalError("Invalid playlists.yml structure: \(error)")
        }
    }
}
