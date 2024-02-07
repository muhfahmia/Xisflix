//
//  MovieRepository.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import Combine

protocol MovieRepository {
    func list(param: MovieListParameter) -> AnyPublisher<[Movie], Error>
    func discovery(param: MovieDiscoveryParameter) -> AnyPublisher<[Movie], Error>
}

struct DefaultMovieRepository: MovieRepository {
    
    private let dataSource: MovieDataSource
    
    init(dataSource: MovieDataSource) {
        self.dataSource = dataSource
    }
    
    func list(param: MovieListParameter) -> AnyPublisher<[Movie], Error> {
        dataSource.list(param: param).map{
            MovieMapper.moviesMapperToDomain(movies: $0.movies)
        }.eraseToAnyPublisher()
    }
    
    func discovery(param: MovieDiscoveryParameter) -> AnyPublisher<[Movie], Error> {
        dataSource.discovery(param: param).map {
            MovieMapper.moviesMapperToDomain(movies: $0.movies)
        }.eraseToAnyPublisher()
    }
}
