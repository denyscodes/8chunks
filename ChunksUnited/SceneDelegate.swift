//
//  SceneDelegate.swift
//  ChunksUnited
//
//  Created by Denis on 7/13/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import UIKit
import SwiftUI
import Yams

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        let playlistsScreen = PlaylistsScreen(playlists: Playlist.all)

        if let windowScene = scene as? UIWindowScene {
            let window = UIWindow(windowScene: windowScene)
            window.rootViewController = UIHostingController(rootView: playlistsScreen)
            self.window = window
            window.makeKeyAndVisible()
        }
    }
}
