//
//  PlaylistMakingService.swift
//  8chunks
//
//  Created by Denis on 7/20/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import AVFoundation

class PlaylistMakingService {
    
    private let playlist: Playlist
    
    private var assets: [AVAsset] {
        return playlist.clips.map {AVAsset(url: $0.videoUrl)}
    }
    
    init(playlist: Playlist) {
        self.playlist = playlist
    }
    
    func makePlayable() -> AVPlayerItem {
        let composition = AVMutableComposition()
        var duration: CMTime = .zero
        
        assets.forEach {asset in
            addTrack(asset: asset, to: composition, at: duration)
            duration = CMTimeAdd(duration, asset.duration)
        }
        
        return AVPlayerItem(asset: composition)
    }
    
    private func addTrack(asset: AVAsset,
                          to composition: AVMutableComposition,
                          at time: CMTime) {
        do {
            let range = CMTimeRange(start: .zero, duration: asset.duration)
            try composition.insertTimeRange(range,
                                            of: asset,
                                            at: time)
        } catch let error {
            print(error)
        }
    }
}
