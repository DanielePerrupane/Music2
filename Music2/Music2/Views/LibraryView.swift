//
//  LibraryView.swift
//  Music2
//
//  Created by Daniele Perrupane on 24/11/23.
//

import SwiftUI

struct LibraryView: View {
    var songModel : SongViewModel
    //var song : Song
    var body: some View {
        NavigationView {
            List{
                ForEach(0..<songModel.songs.count, id: \.self) { index in
                        HStack{

                            Image(systemName: songModel.songs[index].cover)         
                                .frame(width: 60,height: 60)
                                
                                
                            VStack(alignment: .leading) {
                                Text(songModel.songs[index].title)
                                    .fontWeight(.medium)
                                    .font(/*@START_MENU_TOKEN@*/.headline/*@END_MENU_TOKEN@*/)
                                Text(songModel.songs[index].artist)
                                    .fontWeight(.medium)
                                    .foregroundStyle(.gray)
                                    .font(.callout)
                            }
                            Spacer()
                            Image(systemName: "ellipsis")
                                
                        }
                    
                }
            }.navigationTitle("Library")
        }
    }
}

#Preview {
    LibraryView(songModel: SongViewModel())
}
