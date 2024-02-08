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
    
    static func movieMapperToDomain(movie: Movie) -> Movie {
        return Movie(
            movieID: movie.movieID,
            title: movie.title,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath,
            releaseDate: movie.releaseDate,
            description: movie.description,
            adult: movie.adult,
            duration: movie.duration,
            trailer: movie.trailer
        )
    }
    
    static func movieMapperToDomainWithVideoCredits(movie: Movie, videos: [MovieVideo], casts: [MovieCast]) -> Movie {
        let videoTrailer = videos.filter { $0.official == true && $0.platform == "YouTube"}
        let casts = casts.filter { $0.departement == "Acting"}.sorted{ $0.popularity > $1.popularity }
        return Movie(
            movieID: movie.movieID,
            title: movie.title,
            posterPath: movie.posterPath,
            backdropPath: movie.backdropPath,
            releaseDate: movie.releaseDate,
            description: movie.description,
            adult: movie.adult,
            duration: movie.duration,
            trailer: videoTrailer.first ?? MovieVideo(),
            casts: casts,
            rating: round(movie.rating * 10) / 10.0
        )
    }
}
