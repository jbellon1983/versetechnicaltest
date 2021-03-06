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

//sourcery: AutoMockable
protocol MovieListViewModelProtocol {
    var searchText: BehaviorRelay<String> { get }
    var movies: BehaviorRelay<[Movie]> { get }
    func loadNewSearchMovies(query: String)
    func loadMoreMovies()
    func resetMovies()
}

class MovieListViewModel : MovieListViewModelProtocol {
    
    let disposeBag: DisposeBag
    var movies = BehaviorRelay<[Movie]>.init(value: [])
    var searchText: BehaviorRelay<String>
    var page: Int = 0
    
    let provider : MovieProviderProtocol

    init(provider: MovieProviderProtocol) {
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
    
    func resetMovies() {
        self.searchText.accept("")
        self.movies.accept([])
    }
    
}


