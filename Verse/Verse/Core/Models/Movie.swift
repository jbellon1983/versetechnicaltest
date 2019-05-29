//
//  Movie.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation

struct Movie {
    var title: String
    var vote_count: Int
    var overview: String
    var poster_path: String?
    
    init(dto: MovieDto) {
        self.title = dto.title
        self.vote_count = dto.vote_count
        self.overview = dto.overview
        self.poster_path = dto.poster_path
    }
}
