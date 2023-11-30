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
                //#3 ACCOUNT VIEW
//                AGGIUNGERE UN FRAME CIRCOLARE CON IMMAGINE
//                E CREARE UNA STRUTTURA SU PIU' RIGHI CON I DATI DELL'ACCOUNT
                AccountView(account: Account(name: "Daniele", surname: "Perrupane", age: "28", gender: "M", image: "account"))
                    .tabItem {
                        Text("Account")
                        Image(systemName: "person.fill")
                            .foregroundColor(.blue)
                    }.tag(2)
                
                
            }.accentColor(.red)
            
        }
    }
}

#Preview {
    TabBarView()
}
