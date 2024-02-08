//
//  Movie.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation


struct MovieListParameter: Encodable {
    let pathType: PathTypeMovie
    let apiKey: String
    let page: Int
    
    enum PathTypeMovie: String {
        case trending = "trending/movie"
        case popular = "popular"
        case topRated = "top_rated"
        case upComing = "upcoming"
        case nowPlaying = "now_playing"
    }
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case page
    }
    
    init(type: PathTypeMovie, page: Int) {
        self.pathType = type
        self.apiKey = Constants.apiKey
        self.page = page
    }
}

struct MovieDiscoveryParameter: Encodable {
    let apiKey: String
    var page: Int
    var originCountry: String
    var releaseDate: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case page
        case originCountry = "with_origin_country"
        case releaseDate = "release_date.gte"
    }
    
    init(apiKey: String = Constants.apiKey, page: Int, originCountry: String = "ID", releaseDate: String = "2024-02-01") {
        self.apiKey = apiKey
        self.page = page
        self.originCountry = originCountry
        self.releaseDate = releaseDate
    }
    
}

struct MovieDetailParameter: Encodable {
    
    var movieID: String
    let apiKey: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
    }
    
    init(movieID: String, apiKey: String = Constants.apiKey) {
        self.movieID = movieID
        self.apiKey = apiKey
    }
}


struct MovieSearchParameter: Encodable {
    
    var query: String
    let apiKey: String
    
    enum CodingKeys: String, CodingKey {
        case apiKey = "api_key"
        case query
    }
    
    init(query: String, apiKey: String = Constants.apiKey) {
        self.query = query
        self.apiKey = apiKey
    }
}
