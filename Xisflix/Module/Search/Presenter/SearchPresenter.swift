//
//  SearchPresenter.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 08/02/24.
//

import Foundation
import Combine

class SearchPresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var movieSearchParam: MovieSearchParameter = .init(query: "")
    @Published var movieSearch: ViewState<[Movie]> = .initiate
    
    let movieListUseCase: MovieListUseCase
    
    init(movieListUseCase: MovieListUseCase) {
        self.movieListUseCase = movieListUseCase
    }
    
    func setMovieQuery(query: String) {
        movieSearchParam.query = query
    }
    
    func getMovieSearchList() {
        movieSearch = .loading
        movieListUseCase.search(param: movieSearchParam)
            .receive(on: RunLoop.main)
            .sink(receiveCompletion: { result in
            switch result {
            case .finished:break
            case .failure(_):break
            }
            }, receiveValue: { [weak self] value in
                if value.isEmpty {
                    self?.movieSearch = .empty
                } else {
                    self?.movieSearch = .success(data: value)
                }
            }).store(in: &cancellables)
    }
    
}
