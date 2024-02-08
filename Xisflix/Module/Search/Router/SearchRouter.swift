//
//  HomeRouter.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation
import SwiftUI

struct SearchRouter {
    
    private let assembler: Assembler
    
    init(assembler: Assembler) {
        self.assembler = assembler
    }
    
    func routeToDetail(movie: Movie) -> some View {
        return DetailView(vm: assembler.resolve(movie: movie))
    }
    
}
