//
//  Clip.swift
//  ChunksUnited
//
//  Created by Denis on 7/13/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import Foundation

struct Clip: Decodable {
    let url: String
    let start: String
    let end: String
    let name: String
    
    var localUrl: URL? {
        guard let path = Bundle.main.path(forResource: name, ofType: "mp4", inDirectory: "Videos") else {
            return nil
        }
        
        return URL(string: path)
    }
}
