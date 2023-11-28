//
//  LibraryView.swift
//  Music2
//
//  Created by Daniele Perrupane on 24/11/23.
//

import SwiftUI
import UIKit

struct LibraryView: View {
    @Environment(\.colorScheme) var colorScheme
    @ObservedObject var songModel: SongViewModel
    @State private var searchString = ""
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack {
                    ForEach(songModel.filteredSongs(for: searchString)) { song in
                        NavigationLink(destination: MusicPlayerView(song: song)) {
                            LibraryRowView(song: Song(title: song.title, artist: song.artist, album: song.album, cover: song.cover))
                        }
                        Spacer(minLength: 15)
                        
                    }
                }.padding(.horizontal,20)
                
            }.searchable(text: $searchString, placement: .automatic, prompt: "Your Library")
                .navigationBarTitle("Music")
            
        }
        
    }
}

struct LibraryRowView: View {
    @State private var showShong = false
    @Environment(\.colorScheme) var colorScheme
    let song: Song
    
    var body: some View {
        HStack(alignment: .center) {
            Image(song.cover)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10.0)
            
            VStack(alignment: .leading) {
                Text(song.title)
                    .foregroundStyle(colorScheme == .dark ?
                                     //DarkMode
                                     Color.white :
                                        //LightMode
                                     Color.black )
                    .fontWeight(.medium)
                    .font(.headline)
                Text(song.artist)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .font(.callout)
            }
            
            Spacer()
            Button(action:
            {
                //INSERIRE ACTION PER ELLIPSIS
            }, label: {
                Image(systemName: "ellipsis")
                    .foregroundColor(.gray) // Colore personalizzabile
                    .imageScale(.large)
            })
            
            
        }
        Button(action: {
            showShong = true
        }, label: {
            
        })
        .fullScreenCover(isPresented: $showShong, content: {
            
            MusicPlayerView(song: song)
            
        })
        .padding(.vertical, 8)
        
    }
}

struct LibraryView_Previews: PreviewProvider {
    static var previews: some View {
        LibraryView(songModel: SongViewModel())
    }
}


#Preview {
    LibraryView(songModel: SongViewModel())
}
