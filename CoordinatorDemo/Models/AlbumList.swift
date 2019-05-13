//
//  AlbumList.swift
//  CoordinatorDemo
//
//  Created by Tanya Landsman on 3/2/19.
//  Copyright © 2019 Tanya Landsman. All rights reserved.
//

import Foundation

struct AlbumList: Codable, DataEncodable {
    let resultCount: Int
    let results: [Album]
}

struct Album: Codable, DataEncodable {
    let artistName: String
    let trackName: String
}
