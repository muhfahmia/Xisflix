//
//  MovieHeadlineCard.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieHeadlineCard: View {
    
    let heightImage: CGFloat
    let movie: Movie
    
    var body: some View {
        HStack(alignment: .top) {
            WebImage(url: URL(string: Constants.imgUrl+movie.posterPath))
                .resizable()
                .indicator(.activity)
                .aspectRatio(contentMode: .fill)
                .frame(height: heightImage)
                .scaledToFit()
                .cornerRadius(6)
                .padding(.bottom, 12)
                .cornerRadius(8)
            VStack(alignment: .leading, spacing: 15) {
                Text("\(movie.title)")
                    .font(.title)
                    .lineLimit(2)
                Text("\(movie.description)")
                    .font(.caption)
            }
        }
        .padding(.horizontal, 10)
    }
}

//#Preview {
//    MovieHeadlineCard()
//}
