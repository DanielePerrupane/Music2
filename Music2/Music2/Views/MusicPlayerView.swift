//
//  SongPlayedView.swift
//  Music2
//
//  Created by Daniele Perrupane on 27/11/23.
//

import SwiftUI
import UIKit

struct MusicPlayerView: View {
    @Environment(\.colorScheme) var colorScheme
    @State private var isPlaying = false
    var song : Song
    // Sostituisci con la durata totale della traccia
    @State private var totalTime: Double = 251.0
    //Tempo corrente
    @State private var currentTime: Double = 0.0
    var body: some View {
        NavigationView {
            VStack{
                Rectangle()
                    .frame(width: 250,height: 250.0)
                    .overlay(
                        Image(song.cover)
                            .resizable()
                    )
                    .cornerRadius(10.0)
                    .padding(.horizontal,85.0)
                Rectangle()
                    .frame(height: 40.0)
                    .foregroundColor(.clear)
                
                VStack {
                    VStack(alignment: .leading) {
                        Text(song.title)
                            .fontWeight(.bold)
                            .foregroundStyle(colorScheme == .dark ?
                                             //DarkMode
                                             Color.white :
                                                //LightMode
                                             Color.black )
                            .font(.title2)
                        Text(song.artist)
                            .fontWeight(.semibold)
                            .foregroundStyle(.gray)
                            .font(.title3)
                        Slider(value: $currentTime, in: 0...totalTime)
                        
                        HStack {
                            Text("\(formattedTime(currentTime))")
                            Spacer()
                            Text("\(formattedTime(totalTime))")
                        }
                    }
                    .padding(.horizontal,30.0)
                    Rectangle()
                        .frame(height: 20.0)
                        .foregroundColor(.clear)
                    
                    HStack {
                        //BACKWARD
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "backward.fill")
                                .foregroundStyle(colorScheme == .dark ?
                                                 //DarkMode
                                                 Color.white :
                                                    //LightMode
                                                 Color.black )
                                .font(.title)
                        })
                        
                        Spacer(minLength: 80)
                        //PLAY
                        Button(action: {
                            // Inverti lo stato di riproduzione/pausa
                            isPlaying.toggle()
                        }, label: {
                            Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                                .foregroundStyle(colorScheme == .dark ?
                                                 //DarkMode
                                                 Color.white :
                                                    //LightMode
                                                 Color.black )
                                .font(.title)
                        })
                        
                        Spacer(minLength: 80)
                        //FORWARD
                        Button(action: {
                            
                        }, label: {
                            Image(systemName: "forward.fill")
                                .foregroundStyle(colorScheme == .dark ?
                                                 //DarkMode
                                                 Color.white :
                                                    //LightMode
                                                 Color.black )
                                .font(.title)
                            
                        })
                    }
                    .padding(.horizontal,65.0)
                }
                
                
                
            }
            
            
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
    
    
    // Formatta il tempo in mm:ss
    func formattedTime(_ time: Double) -> String {
        let minutes = Int(time) / 60
        let seconds = Int(time) % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}
//PREVIEW DEL MINIPLAYER
struct MusicPlayerView_Previews: PreviewProvider {
    static var previews: some View {
        MusicPlayerView(song: Song(title: "Tutti", artist: "Calcutta", album: "RELAX", cover: "relax"))
    }
}

#Preview {
    MusicPlayerView(song : Song(title: "Tutti", artist: "Calcutta", album: "RELAX", cover: "relax"))
}
