//
//  MovieMapper.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

struct MovieMapper {
    static func moviesMapperToDomain(movies: [Movie]) -> [Movie] {
        return movies.enumerated().map { (index, movie) in
            let rank = index + 1
            return Movie(ranking: rank, movieID: movie.movieID, title: movie.title, posterPath: movie.posterPath, backdropPath: movie.backdropPath, releaseDate: movie.releaseDate, description: movie.description, adult: movie.adult, duration: movie.duration, country: movie.country, rating: movie.rating)
        }
    }
}
