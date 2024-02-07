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
        case .discovery(let param):
            return "discover/movie"
        }
    }

    var headers: [String : String]? {
        nil
    }
    
    var method: HTTPMethod {
        .get
    }
    
}
