//
//  MovieDataSource.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

import Combine

protocol MovieDataSource {
    func list(param: MovieListParameter) -> AnyPublisher<Movies, Error>
    func discovery(param: MovieDiscoveryParameter) -> AnyPublisher<Movies, Error>
}

struct DefaultMovieDataSource: MovieDataSource {
    func list(param: MovieListParameter) -> AnyPublisher<Movies, Error> {
        return NetworkService.shared.request(baseAPI: MovieAPI.list(param: param))
    }
    
    func discovery(param: MovieDiscoveryParameter) -> AnyPublisher<Movies, Error> {
        return NetworkService.shared.request(baseAPI: MovieAPI.discovery(param: param))
    }
}
