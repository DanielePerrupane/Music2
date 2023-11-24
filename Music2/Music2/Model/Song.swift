//
//  Song.swift
//  Music2
//
//  Created by Daniele Perrupane on 24/11/23.
//

import Foundation

struct Song : Identifiable{
    
    var id : UUID = UUID()
    var title : String
    var artist : String
    var album : String
    var cover : String
}
