//
//  MovieListViewModelTest.swift
//  VerseTests
//
//  Created by Jesus Bellon Quixal on 02/06/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import XCTest
import SwiftyMocky
@testable import Verse

class MovieListViewModelTest: XCTestCase {
    
    var viewModel: MovieListViewModel!
    var provider: MovieProviderProtocolMock!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        provider = MovieProviderProtocolMock()
        viewModel = MovieListViewModel.init(provider: provider)
    }

    func testloadMoreMovies() {
        // Test prepare
        // Test execution
        viewModel.loadMoreMovies()
        // Test verification
        Verify(provider, .getMovies(query: .any, page: .any, onSuccess: .any, onError: .any))
    }
    
    func testloadNewSearchMovies() {
        // Test prepare
        // Test execution
        viewModel.loadNewSearchMovies(query: "rocky")
        // Test verification
        Verify(provider, .getMovies(query: .any, page: .any, onSuccess: .any, onError: .any))
        XCTAssert(!viewModel.searchText.value.isEmpty)
    }
}
