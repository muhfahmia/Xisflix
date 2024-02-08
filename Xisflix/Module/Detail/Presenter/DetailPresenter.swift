//
//  DetailPresenter.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import Combine

class DetailPresenter: ObservableObject {
    
    private var cancellables: Set<AnyCancellable> = []
    
    @Published var movieDetailParam: MovieDetailParameter = .init(movieID: "")
    @Published var movie: ViewState<Movie> = .initiate
    
    private let detailUseCase: MovieDetailUseCase
    
    init(detailUseCase: MovieDetailUseCase) {
        self.detailUseCase = detailUseCase
    }
    
    func setMovieID(movieID: String) {
        movieDetailParam.movieID = movieID
    }
    
    func getMovieDetail() {
        movie = .loading
        detailUseCase.detail(param: movieDetailParam)
        .receive(on: RunLoop.main)
        .sink(receiveCompletion: { result in
            switch result {
            case .finished:break
            case .failure(_):break
            }
        }, receiveValue: { [weak self] value in
            self?.movie = .success(data: value)
        }).store(in: &cancellables)
    }
    
}
