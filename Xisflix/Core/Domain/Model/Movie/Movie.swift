//
//  Movie.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

struct Movie: Identifiable {
    var id: UUID = UUID()
    var ranking: Int = 0
    var movieID: Int = 0
    var title: String = ""
    var posterPath: String = ""
    var backdropPath: String = ""
    var releaseDate: String = ""
    var description: String = ""
    var adult: Bool = false
    var duration: Int = 0
    var country: String = ""
    var productionHouse: String = ""
//    var _productionHouse: [MoviePH] = [MoviePH()]
//    var trailer: MovieVideo = MovieVideo()
//    var casts: [MovieCast] = []
    var rating: Double = 0.0
}


struct Movies {
    var page: Int = 0
    var movies: [Movie] = []
}

