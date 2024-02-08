//
//  CoreAssembler.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

protocol CoreAssembler {
    func resolve() -> MovieDataSource
    func resolve() -> MovieRepository
    func resolve() -> MovieListUseCase
    func resolve() -> MovieDetailUseCase
}

extension CoreAssembler where Self: Assembler {
    func resolve() -> MovieDataSource {
        DefaultMovieDataSource()
    }
    
    func resolve() -> MovieRepository {
        DefaultMovieRepository(dataSource: resolve())
    }
    
    func resolve() -> MovieListUseCase {
        MovieListInteractor(repository: resolve())
    }
    
    func resolve() -> MovieDetailUseCase {
        MovieDetailInteractor(repository: resolve())
    }
}
