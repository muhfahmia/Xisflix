//
//  MovieCard.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCard: View {
    
    let movie: Movie
    let heightImage: CGFloat
    
    var body: some View {
        VStack(alignment: .leading) {
            WebImage(url: URL(string: Constants.imgUrl+movie.posterPath))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fill)
                .frame(height: heightImage)
                .scaledToFit()
                .cornerRadius(6)
                .padding(.bottom, 12)
                .cornerRadius(8)
            Text("\(movie.title)")
                .font(.subheadline)
                .bold()
        }
    }
}
