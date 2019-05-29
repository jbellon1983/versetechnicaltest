//
//  MovieEndpoint.swift
//  Verse
//
//  Created by Jesus Bellon Quixal on 28/05/2019.
//  Copyright © 2019 Jesus Bellon Quixal. All rights reserved.
//

import Foundation
import Moya

enum MovieEndpoint {
    case search(query: String, page: Int)
}

extension MovieEndpoint : TargetType {
    var baseURL: URL {
        switch self {
        case .search:
            return URL.init(string: "https://api.themoviedb.org/3")!
        }
    }
    
    var path: String {
        switch self {
        case .search:
            return "/search/movie"
        }
    }
    
    var parameters: [String: Any] {
        switch self {
        case .search(let query, let page):
            var params = [String: Any]()
            if let api_key = Bundle.main.infoDictionary?["API_KEY"] as? String {
                params["api_key"] = api_key
            }
            params["query"] = query
            params["page"] = page
            return params
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .search:
            return .get
        }
    }
    
    var sampleData: Data {
        switch self {
        default:
            return Data()
        }
    }
    
    var task: Task {
        switch self {
        default:
            return .requestParameters(parameters: parameters, encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
    

}
