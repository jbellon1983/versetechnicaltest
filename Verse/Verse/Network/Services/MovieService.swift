//.
//  MovieService.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import Moya

class MovieService {
    let provider = MoyaProvider<MovieEndpoint>()
    
    func getMovies(query: String, page: Int, onSuccess: @escaping (([MovieDto]) -> Void), onError: @escaping (() -> Void) )  {
        let endpoint : MovieEndpoint = .search(query: query, page: page)
        provider.request(endpoint) { (result) in
            switch result {
            case .success(let response):
                guard let decodedData = try? JSONDecoder().decode(ResponseDto.self, from: response.data) else {
                    onError()
                    return
                }
                onSuccess(decodedData.results)
            case .failure:
                onError()
            }
        }
    }
}
