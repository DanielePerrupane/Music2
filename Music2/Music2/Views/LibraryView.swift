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
        NavigationView {
            List {
                ForEach(songModel.filteredSongs(for: searchString)) { song in
                    
                    NavigationLink(destination: MusicPlayerView(song: song)) {
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
                                // Azione per il pulsante ellissi, se necessario
                            }) {
                                Image(systemName: "ellipsis")
                                    .foregroundStyle(colorScheme == .dark ?
                                                     //DarkMode
                                                     Color.white :
                                                        //LightMode
                                                     Color.black )
                                    .imageScale(.large)
                            }
                        }
                    }
                    // Rimuove lo stile di pulsante predefinito di NavigationLink
                    .buttonStyle(PlainButtonStyle(
                    
                    ))
                    
                }
                .navigationBarBackButtonHidden(true)
                
            }
            
            .searchable(text: $searchString, placement: .automatic, prompt: "Your Library")
            .navigationBarTitle("Music")
            
        }
    }
}

struct LibraryRowView: View {
    @State private var showShong = false
    @Environment(\.colorScheme) var colorScheme
    let song: Song
    
    var body: some View {
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
