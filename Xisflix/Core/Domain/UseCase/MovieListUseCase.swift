//
//  MovieListUseCase.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import Combine

protocol MovieListUseCase {
    func list(param: MovieListParameter) -> AnyPublisher<[Movie], Error>
    func discovery(param: MovieDiscoveryParameter) -> AnyPublisher<[Movie], Error>
}

struct MovieListInteractor: MovieListUseCase {
    
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func list(param: MovieListParameter) -> AnyPublisher<[Movie], Error> {
        repository.list(param: param)
    }
    
    func discovery(param: MovieDiscoveryParameter) -> AnyPublisher<[Movie], Error> {
        repository.discovery(param: param)
    }
    
}
