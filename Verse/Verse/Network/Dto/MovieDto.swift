//
//  MovieDto.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation

struct ResponseDto: Decodable {
    let results: [MovieDto]
}

struct MovieDto : Decodable {
    var title: String
    var vote_count: Int
    var overview: String
    var poster_path: String?
}
