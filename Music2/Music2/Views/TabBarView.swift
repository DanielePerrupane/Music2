//
//  TabBarView.swift
//  Music2
//
//  Created by Daniele Perrupane on 24/11/23.
//

import SwiftUI

struct TabBarView: View {
    @State private var selectedTab: Int = 0
    var body: some View {
        
        //LA ZSTACK SERVE PER SOVRAPPORRE IL MINIPLAYER
        //DA IMPLEMENTARE SUCCESSIVAMENTE
        
        //IL TITLE PROBABILMENTE è DA IMPLEMENTARE NELLE
        //SINGOLE VIEWS 
        ZStack {
            TabView(selection: $selectedTab){
                
                //SOSTITUIRE CON LE VARIE VIEWS DESIDERATE
                
                
                //#1 TAB ITEM
                //FAVORITI DA IMPLEMENTARE
                //CON UNA LISTA COME
                //SE FOSSE LA PROPRIA LIBRARY
                //LASCIARE L'ICONA DELLA STELLA
                //O USARE DEI LIBRI
                //IMPLEMENTARLO COME UNA LIST CHE HA
                //COVER, TITOLO CANZONE INVECE DEL TITOLO
                //ALBUM E NOME ARTISTA
                //AGGIUNGERE ANCHE UNA SEARCHBAR
                LibraryView(songModel: SongViewModel())
                    .tabItem {
                        Text("Music")
                        Image(systemName: "music.note.list")
                            .foregroundColor(.blue)
                    }.tag(0)
                //#2 TAB ITEM
                //
                SongView(song: Song(title: "", artist: "Chris Brown", album: "Indigo", cover: "indigo"))
                    .tabItem {
                        Text("Search")
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.blue)
                    }.tag(1)
                //#3 TAB ITEM
                SongView(song: Song(title: "", artist: "Bryson Tiller", album: "T R A P S O U L", cover: "trapsoul"))
                    .tabItem {
                        Text("Star")
                        Image(systemName: "star.fill")
                            .foregroundColor(.blue)
                    }.tag(2)
                //#4 TAB ITEM
                SongView(song: Song(title: "", artist: "Tory Lanez", album: "Alone At Prom", cover: "aloneatprom"))
                    .tabItem {
                        Text("Star")
                        Image(systemName: "star.fill")
                            .foregroundColor(.blue)
                    }.tag(3)
                
                
            }.accentColor(.red)
            
        }
    }
}

#Preview {
    TabBarView()
}
