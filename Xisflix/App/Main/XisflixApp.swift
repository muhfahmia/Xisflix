//
//  XisflixApp.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import SwiftUI

@main
struct XisflixApp: App {
    
    let assembler: Assembler = AppAssembler.shared
    
    var body: some Scene {
        WindowGroup {
            HomeView(vm: assembler.resolve())
        }
    }
}
