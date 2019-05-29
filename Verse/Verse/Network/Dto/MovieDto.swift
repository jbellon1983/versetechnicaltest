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
    
//    required init(from decoder: Decoder) throws {
//        let container = try decoder.container(keyedBy: CodingKeys.self)
//        self.title = try container.decode(String.self, forKey: .title)
//        self.vote_count = try container.decode(Int.self, forKey: .vote_count)
//        self.overview = try container.decode(String.self, forKey: .overview)
//        self.poster_path =  try container.decode(String.self, forKey: .poster_path)
//        try super.init(from: decoder)
//    }
//
//    enum CodingKeys: String, CodingKey {
//        case title, vote_count, overview, poster_path
//    }
}
