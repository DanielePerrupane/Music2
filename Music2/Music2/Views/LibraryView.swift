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
                        
                            LibraryRowView(song: Song(title: song.title, artist: song.artist, album: song.album, cover: song.cover))
                        
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
    @GestureState private var dragOffset: CGFloat = 0.0
    @State private var showShongOffset: CGFloat = 0.0

    let song: Song

    var body: some View {
        Button {
            showShong = true
        } label: {
            HStack(alignment: .center) {
                Image(song.cover)
                    .resizable()
                    .frame(width: 60, height: 60)
                    .cornerRadius(10.0)

                VStack(alignment: .leading) {
                    Text(song.title)
                        .foregroundStyle(colorScheme == .dark ?
                                         Color.white :
                                         Color.black)
                        .fontWeight(.medium)
                        .font(.headline)
                    Text(song.artist)
                        .fontWeight(.medium)
                        .foregroundStyle(.gray)
                        .font(.callout)
                }

                Spacer()
                Button(action: {
                    // Azione per ellipsis
                }, label: {
                    Image(systemName: "ellipsis")
                        .foregroundColor(.gray)
                        .imageScale(.large)
                })
            }
        }
        .fullScreenCover(isPresented: $showShong, content: {
            MusicPlayerView(song: song)
                .offset(y: showShongOffset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            let translation = value.translation.height
                            // Aggiorna l'offset solo se il trascinamento è verso il basso
                            if translation > 0 {
                                withAnimation {
                                    showShongOffset = translation
                                }
                            }
                        }
                        .onEnded { value in
                            // Chiudi la fullScreenCover solo se l'offset supera una certa soglia
                            if value.translation.height > 100 {
                                showShong = false
                            } else {
                                // Resetta l'offset se la soglia non è stata superata
                                withAnimation {
                                    showShongOffset = 0
                                }
                            }
                        }
                )
        })
        .onChange(of: showShong, perform: { newValue in
            // Resetta l'offset quando la vista viene chiusa
            if !newValue {
                showShongOffset = 0
            }
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
