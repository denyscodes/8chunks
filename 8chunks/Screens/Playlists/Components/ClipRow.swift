//
//  ClipRow.swift
//  8chunks
//
//  Created by Denis on 7/15/20.
//  Copyright © 2020 Denis. All rights reserved.
//

import SwiftUI

struct ClipRow: View {
    let clip: Clip
    
    var body: some View {
        HStack {
            Image(uiImage: UIImage(data: clip.thumbnailData)!)
                .resizable()
                .frame(width: 100, height: 60, alignment: .center)
                .clipped()
                .cornerRadius(8)
            Text(clip.name)
            Spacer()
        }
    }
}

struct ClipRow_Previews: PreviewProvider {
    static var previews: some View {
        ClipRow(clip: Playlist.all[0].clips[0])
    }
}
