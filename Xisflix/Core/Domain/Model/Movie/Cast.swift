//
//  Cast.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 08/02/24.
//

import Foundation

struct MovieCasts: Identifiable {
    var id: UUID = UUID()
    var movieID: Int = 0
    var casts: [MovieCast] = []
}

struct MovieCast: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var popularity: Double = 0.0
    var nameCharacter: String = ""
    var departement: String = ""
    var profilePath: String = ""
}
