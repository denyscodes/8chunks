//
//  PlaylistsScreen.swift
//  ChunksUnited
//
//  Created by Denis on 7/13/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import SwiftUI
import Yams

struct PlaylistsScreen: View {
    var playlists: [Playlist]
    @State private var videoUrl: URL?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(playlists, id: \.name) {playlist in
                    Section(header: Text(playlist.name)) {
                        ForEach(playlist.clips, id: \.name) {clip in
                            Text(clip.name)
                        }
                    }
                }
            }.listStyle(GroupedListStyle())
                .navigationBarTitle("Playlists")
        }
    }
}
