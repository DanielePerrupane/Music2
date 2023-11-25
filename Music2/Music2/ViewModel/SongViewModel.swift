//
//  SongViewModel.swift
//  Music2
//
//  Created by Daniele Perrupane on 24/11/23.
//

import Foundation

import Combine


class SongViewModel : ObservableObject {
    
    //Array contentente le canzoni
    @Published var songs : [Song]
    
    init() {
         
        self.songs = [
            Song(title: "Right My Wrongs", artist: "Bryson Tiller", album: "TRAPSOUL", cover: "trapsoul"),
            Song(title: "Tutti", artist: "Calcutta", album: "Relax", cover: "relax"),
            Song(title: "Under The Influence", artist: "Chris Brown", album: "Indigo", cover: "indigo"),
            Song(title: "Right My Wrongs", artist: "Bryson Tiller", album: "TRAPSOUL", cover: "trapsoul"),
            Song(title: "Tutti", artist: "Calcutta", album: "Relax", cover: "relax"),
            Song(title: "Under The Influence", artist: "Chris Brown", album: "Indigo", cover: "indigo"),
            Song(title: "Right My Wrongs", artist: "Bryson Tiller", album: "TRAPSOUL", cover: "trapsoul"),
            Song(title: "Tutti", artist: "Calcutta", album: "Relax", cover: "relax"),
            Song(title: "Under The Influence", artist: "Chris Brown", album: "Indigo", cover: "indigo"),
            Song(title: "Right My Wrongs", artist: "Bryson Tiller", album: "TRAPSOUL", cover: "trapsoul"),
            Song(title: "Tutti", artist: "Calcutta", album: "Relax", cover: "relax"),
            Song(title: "Under The Influence", artist: "Chris Brown", album: "Indigo", cover: "indigo"),
            Song(title: "Right My Wrongs", artist: "Bryson Tiller", album: "TRAPSOUL", cover: "trapsoul"),
            Song(title: "Tutti", artist: "Calcutta", album: "Relax", cover: "relax"),
            Song(title: "Under The Influence", artist: "Chris Brown", album: "Indigo", cover: "indigo"),
            Song(title: "Right My Wrongs", artist: "Bryson Tiller", album: "TRAPSOUL", cover: "trapsoul"),
            Song(title: "Tutti", artist: "Calcutta", album: "Relax", cover: "relax"),
            Song(title: "Under The Influence", artist: "Chris Brown", album: "Indigo", cover: "indigo"),
                      ]
    }
    
    
    func filteredSongs(for searchText: String) -> [Song] {
        
        guard !searchText.isEmpty else {
            return songs
        }
        
        return self.songs.filter { song in
            return song.title.localizedCaseInsensitiveContains(searchText) ||
                               song.artist.localizedCaseInsensitiveContains(searchText)
        }
    }
}
