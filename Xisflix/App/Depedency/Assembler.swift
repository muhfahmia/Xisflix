//
//  Assembler.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import Foundation

protocol Assembler: CoreAssembler, HomeAssembler {}

class AppAssembler: Assembler {
    static let shared = AppAssembler()
}
