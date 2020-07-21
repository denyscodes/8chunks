//
//  PlayerScreen.swift
//  8chunks
//
//  Created by Denis on 7/15/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import SwiftUI
import AVKit

struct PlayerScreen {
    
    private let player: AVPlayer
    
    init(clip: Clip) {
        self.player = AVPlayer(url: clip.videoUrl)
    }
    
    init(playlist: Playlist) {
        let playableItem = PlaylistMakingService(playlist: playlist).makePlayable()
        self.player = AVPlayer(playerItem: playableItem)
    }
}

extension PlayerScreen: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerController = AVPlayerViewController()
        playerController.player = player
        return playerController
    }
    
    func updateUIViewController(_ playerController: AVPlayerViewController, context: Context) {
        player.play()
    }
}

struct PlayerScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PlayerScreen(clip: Playlist.all[0].clips[0])
            PlayerScreen(playlist: Playlist.all[0])
        }
    }
}
