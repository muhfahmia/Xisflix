//
//  SearchAssembler.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 08/02/24.
//

import Foundation

protocol SearchAssembler {
    func resolve() -> SearchPresenter
    func resolve() -> SearchRouter
}

extension SearchAssembler where Self: Assembler {
    
    func resolve() -> SearchPresenter {
        SearchPresenter(movieListUseCase: resolve())
    }
    
    func resolve() -> SearchRouter {
        SearchRouter(assembler: self)
    }
    
}
