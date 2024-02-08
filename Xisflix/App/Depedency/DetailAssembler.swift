//
//  DetailAssembler.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

protocol DetailAssembler {
    func resolve(movie: Movie) -> DetailPresenter
}

extension DetailAssembler where Self: Assembler {
 
    func resolve(movie: Movie) -> DetailPresenter {
        var presenter: DetailPresenter = DetailPresenter(detailUseCase: resolve())
        presenter.setMovieID(movieID: movie.movieID.description)
       return presenter
    }
    
}
