//
//  Clip.swift
//  8chunks
//
//  Created by Denis on 7/13/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import Foundation
import AVFoundation

struct Clip: Decodable, Identifiable {
    var id: String {
        return fileName
    }
    
    let url: URL
    let name: String
    let start: String
    let end: String
    
    var videoUrl: URL {
        return Bundle.main.url(forResource: fileName, withExtension: "mp4", subdirectory: "Videos")!
    }
    
    var thumbnailUrl: URL {
        return Bundle.main.url(forResource: fileName, withExtension: "png", subdirectory: "Thumbnails")!
    }
    
    var thumbnailData: Data {
        return try! Data(contentsOf: thumbnailUrl)
    }
    
    var fileName: String {
        return "\(youtubeId)_\(start)_\(end)"
    }
    
    private var youtubeId: String {
        let params = URLComponents(url: url, resolvingAgainstBaseURL: false)!.queryItems!
        return params.first {$0.name == "v"}!.value!
    }
}
