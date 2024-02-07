//
//  MovieResponse.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import ObjectMapper

extension Movies: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        page    <- map["page"]
        movies  <- map["results"]
    }
    
}

extension Movie: Mappable {
    
    init?(map: Map) {
        mapping(map: map)
    }
    
    mutating func mapping(map: Map) {
        movieID         <- map["id"]
        title           <- map["title"]
        posterPath      <- map["poster_path"]
        backdropPath    <- map["backdrop_path"]
        adult           <- map["adult"]
        releaseDate     <- map["release_date"]
        description     <- map["overview"]
        duration        <- map["runtime"]
        rating          <- map["vote_average"]
    }
    
}
