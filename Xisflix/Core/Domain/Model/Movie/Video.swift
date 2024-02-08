//
//  Video.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 08/02/24.
//

import Foundation

struct MovieVideos {
    var id: Int = 0
    var videos: [MovieVideo] = [MovieVideo()]
}

struct MovieVideo: Identifiable {
    var id: UUID = UUID()
    var name: String = ""
    var platform: String = ""
    var keyPath: String = ""
    var type: String = ""
    var site: String = ""
    var official: Bool = false
}
