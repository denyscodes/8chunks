//
//  PlaylistSectionHeader.swift
//  8chunks
//
//  Created by Denis on 7/16/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import SwiftUI

struct PlaylistSectionHeader: View {
    let playlist: Playlist
    let playTapped: () -> Void
    
    var body: some View {
        HStack {
            Text(playlist.name)
            Spacer()
            Button(action: playTapped,
                   label: {
                    Text("PLAY")
                    
            })
        }
    }
}

struct PlaylistSectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistSectionHeader(playlist: Playlist.all[0]) {}
    }
}
