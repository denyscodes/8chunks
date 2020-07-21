//
//  PlaylistsScreen.swift
//  8chunks
//
//  Created by Denis on 7/13/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import SwiftUI
import Yams
import AVKit

private enum SheetToShow: Identifiable {
    var id: String {
        switch self {
        case .withClip(let clip):
            return clip.id
        case .withPlaylist(let playlist):
            return playlist.id
        }
    }
    
    case withClip(Clip)
    case withPlaylist(Playlist)
}

struct PlaylistsScreen: View {
    var playlists: [Playlist]
    
    @State private var sheetToShow: SheetToShow?
    
    var body: some View {
        NavigationView {
            List {
                ForEach(playlists) { playlist in
                    Section(header: self.sectionHeader(for: playlist)) {
                        ForEach(playlist.clips) { clip in
                            self.clipRow(for: clip)
                        }
                    }
                }
            }.listStyle(GroupedListStyle())
                .navigationBarTitle("Playlists")
                .sheet(item: self.$sheetToShow) { self.playerScreen(basedOn: $0)}
                .onDisappear {
                    self.sheetToShow = nil
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
    
    private func sectionHeader(for playlist: Playlist) -> some View {
        return PlaylistSectionHeader(playlist: playlist,
                                     playTapped: {
                                        self.sheetToShow = .withPlaylist(playlist)
        })
    }
    
    private func clipRow(for clip: Clip) -> some View {
        return ClipRow(clip: clip).onTapGesture {
            self.sheetToShow = .withClip(clip)
        }
    }
    
    private func playerScreen(basedOn sheetToShow: SheetToShow) -> some View {
        switch sheetToShow {
        case .withPlaylist(let playlist):
            return PlayerScreen(playlist: playlist).edgesIgnoringSafeArea(.all)
        case .withClip(let clip):
            return PlayerScreen(clip: clip).edgesIgnoringSafeArea(.all)
        }
    }
}

struct PlaylistsScreen_Previews: PreviewProvider {
    static var previews: some View {
        PlaylistsScreen(playlists: Playlist.all)
    }
}
