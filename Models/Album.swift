//
//  Album.swift
//  FlixsterPt1
//
//  Created by Barsha Chaudhary on 2/7/24.
//

import Foundation

struct AlbumSearchResponse: Decodable {
    let results: [Album]
}

struct Album: Decodable {
    let poster_path : String
}
