//
//  MovieProvider.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation

class MovieProvider {
    let service: MovieService
    
    init(service: MovieService) {
        self.service = service
    }
    
    public func getMovies(query: String, page: Int, onSuccess: @escaping (([Movie]) -> Void), onError: @escaping (() -> Void) ) {
        service.getMovies(query: query, page: page, onSuccess: { (moviesDto) in
            var movies : [Movie] = []
            moviesDto.forEach({ (dto) in
                movies.append(Movie.init(dto: dto))
            })
            onSuccess(movies)
        }) {
            onError()
        }
    }
}
