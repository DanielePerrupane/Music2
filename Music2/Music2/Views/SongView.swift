//
//  SongView.swift
//  Music2
//
//  Created by Daniele Perrupane on 24/11/23.
//

import SwiftUI

struct SongView: View {
    var song : Song
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        
        VStack (alignment: .leading){
            Rectangle()
                .frame(width: 150,height: 150.0)
                .overlay(
                    Image(song.cover)
                        .resizable()
                )
                .cornerRadius(10.0).shadow(color:Color.gray.opacity(0.7), radius: 10.0)
            VStack(alignment: .leading) {
                Text(song.album)
                    .fontWeight(.medium)
                    .foregroundStyle(colorScheme == .dark ?
                        //DarkMode
                        Color.white :
                        //LightMode
                        Color.black )
                    .font(/*@START_MENU_TOKEN@*/.subheadline/*@END_MENU_TOKEN@*/)
                    
                Text(song.artist)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .font(.footnote)
            }
        }
        
    }
}

#Preview {
    SongView(song: Song(title: "Right My Wrongs", artist: "Bryson Tiller", album: "T R A P S O U L", cover: "trapsoul"))
}
