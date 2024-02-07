//
//  HomeAssembler.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

protocol HomeAssembler {
    func resolve() -> HomePresenter
}

extension HomeAssembler where Self: Assembler {
    
    func resolve() -> HomePresenter {
        HomePresenter(movieListUseCase: resolve())
    }
    
}
