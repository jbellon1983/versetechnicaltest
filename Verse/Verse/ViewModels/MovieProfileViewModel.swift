//
//  MovieProfileViewModel.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import RxCocoa

//sourcery: AutoMockable
protocol MovieProfileViewModelProtocol {
    var movie: Movie { get }
}

class MovieProfileViewModel : MovieProfileViewModelProtocol {
    
    var movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
