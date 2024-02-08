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
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error>
    func videos(param: MovieDetailParameter) -> AnyPublisher<MovieVideos, Error>
    func credits(param: MovieDetailParameter) -> AnyPublisher<MovieCasts, Error>
    func search(param: MovieSearchParameter) -> AnyPublisher<Movies, Error>
}

struct DefaultMovieDataSource: MovieDataSource {
    
    private let network: NetworkService = NetworkService.shared
    
    func list(param: MovieListParameter) -> AnyPublisher<Movies, Error> {
        network.request(baseAPI: MovieAPI.list(param: param))
    }
    
    func discovery(param: MovieDiscoveryParameter) -> AnyPublisher<Movies, Error> {
        network.request(baseAPI: MovieAPI.discovery(param: param))
    }
    
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error> {
        network.request(baseAPI: MovieAPI.detail(param: param))
    }
    
    func videos(param: MovieDetailParameter) -> AnyPublisher<MovieVideos, Error> {
        network.request(baseAPI: MovieAPI.videos(param: param))
    }
    
    func credits(param: MovieDetailParameter) -> AnyPublisher<MovieCasts, Error> {
        network.request(baseAPI: MovieAPI.credits(param: param))
    }
    
    func search(param: MovieSearchParameter) -> AnyPublisher<Movies, Error> {
        network.request(baseAPI: MovieAPI.search(param: param))
    }
    
}
