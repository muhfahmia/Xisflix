//
//  MovieAPI.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import Alamofire

enum MovieAPI {
    case list(param: MovieListParameter)
    case discovery(param: MovieDiscoveryParameter)
    case detail(param: MovieDetailParameter)
    case videos(param: MovieDetailParameter)
    case credits(param: MovieDetailParameter)
    case search(param: MovieSearchParameter)
}

extension MovieAPI: APIFactory {
    
    var baseURL: URL {
        URL(string: Constants.baseUrl)!
    }
    
    var parameters: Encodable {
        switch self {
        case .list(let param):
            return param
        case .discovery(let param):
            return param
        case .detail(let param):
            return param
        case .videos(let param):
            return param
        case .credits(let param):
            return param
        case .search(let param):
            return param
        }
    }
    
    var path: String {
        switch self {
        case .list(let param):
            if param.pathType == .trending {
                return "trending/all/week"
            } else {
                return "movie/\(param.pathType.rawValue)"
            }
        case .discovery(_):
            return "discover/movie"
        case .detail(let param):
            return "movie/\(param.movieID)"
        case .videos(let param):
            return "movie/\(param.movieID)/videos"
        case .credits(let param):
            return "movie/\(param.movieID)/credits"
        case .search(_):
            return "search/movie"
        }
    }

    var headers: [String : String]? {
        nil
    }
    
    var method: HTTPMethod {
        .get
    }
    
}
