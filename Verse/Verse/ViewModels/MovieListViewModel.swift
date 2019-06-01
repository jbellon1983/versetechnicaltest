//
//  MovieListViewModel.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

protocol MovieListViewModelProtocol {
    func loadNewSearchMovies(query: String)
    func loadMoreMovies()
}

class MovieListViewModel : MovieListViewModelProtocol {
    
    let searchText: BehaviorRelay<String>
    let disposeBag: DisposeBag
    var movies = BehaviorRelay<[Movie]>.init(value: [])
    var page: Int = 0
    
    let provider : MovieProvider

    init(provider: MovieProvider) {
        self.provider = provider
        disposeBag = DisposeBag.init()
        searchText = BehaviorRelay.init(value: "")
    }
    
    func loadNewSearchMovies(query: String) {
        searchText.accept(query)
        page = 1
        self.movies.accept([])
        provider.getMovies(query: searchText.value, page: page, onSuccess: { (movies) in
            self.movies.accept(movies)
        }) {
            
        }
    }
    
    func loadMoreMovies() {
        page += 1
        provider.getMovies(query: searchText.value, page: page, onSuccess: { (movies) in
            var current = self.movies.value
            current.append(contentsOf: movies)
            self.movies.accept(current)
        }) {
            
        }
    }
    
}


