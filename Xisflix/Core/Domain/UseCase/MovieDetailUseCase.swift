//
//  MovieDetailUseCase.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import Combine

protocol MovieDetailUseCase {
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error>
}

struct MovieDetailInteractor: MovieDetailUseCase {
    
    private let repository: MovieRepository
    
    init(repository: MovieRepository) {
        self.repository = repository
    }
    
    func detail(param: MovieDetailParameter) -> AnyPublisher<Movie, Error> {
        repository.detail(param: param)
    }
    
}
