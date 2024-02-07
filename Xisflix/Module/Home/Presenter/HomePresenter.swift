//
//  HomePresenter.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import Combine

class HomePresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var movieTrending: ViewState<[Movie]> = .initiate
    @Published var movieID: ViewState<[Movie]> = .initiate
    @Published var moviePopular: ViewState<[Movie]> = .initiate
    @Published var movieParamTrending: MovieListParameter = .init(type: .trending, page: 1)
    @Published var movieParamPopular: MovieListParameter = .init(type: .popular, page: 1)
    @Published var movieParamID: MovieDiscoveryParameter = .init(page: 1)
    
    private let movieListUseCase: MovieListUseCase
    
    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
    }
    
    func getMovieListTrending() {
        movieListUseCase.list(param: movieParamTrending)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { result in
            switch result {
            case .finished:break
            case .failure(_):break
            }
        }, receiveValue: { [weak self] value in
            self?.movieTrending = .success(data: value.filter { $0.ranking < 6})
        }).store(in: &cancellables)
    }
    
    func getMovieListID() {
        movieListUseCase.discovery(param: movieParamID)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
                switch result {
                case .finished:break
                case .failure(_):break
                }
            }, receiveValue: { [weak self] value in
                self?.movieID = .success(data: value)
            }).store(in: &cancellables)
    }
    
    func getMovieListPopular() {
        movieListUseCase.list(param: movieParamPopular)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { result in
            switch result {
            case .finished:break
            case .failure(_):break
            }
        }, receiveValue: { [weak self] value in
            self?.moviePopular = .success(data: value)
        }).store(in: &cancellables)
    }
    
}
