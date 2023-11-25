//
//  LibraryView.swift
//  Music2
//
//  Created by Daniele Perrupane on 24/11/23.
//

import SwiftUI
import UIKit

struct LibraryView: View {
    @ObservedObject var songModel: SongViewModel
    @State private var searchString = ""

    var body: some View {
        NavigationView {
            List {
                ForEach(songModel.filteredSongs(for: searchString)) { song in
                    LibraryRowView(song: song)
                }
            }
            .searchable(text: $searchString, placement: .automatic, prompt: "Your Library")
            .navigationTitle("Music")
        }
    }
}

struct LibraryRowView: View {
    let song: Song

    var body: some View {
        HStack(alignment: .center) {
            Image(song.cover)
                .resizable()
                .frame(width: 60, height: 60)
                .cornerRadius(10.0)

            VStack(alignment: .leading) {
                Text(song.title)
                    .fontWeight(.medium)
                    .font(.headline)
                Text(song.artist)
                    .fontWeight(.medium)
                    .foregroundStyle(.gray)
                    .font(.callout)
            }

            Spacer()
            
            Button(action: {
                
            }, label: {
                Image(systemName: "ellipsis")
            })
                
            
                
            
        }
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
