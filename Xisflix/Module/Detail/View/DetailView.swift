//
//  DetailView.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct DetailView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var vm: DetailPresenter
    
    init(vm: DetailPresenter) {
        self.vm = vm
    }
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                ZStack {
                    Color.background.ignoresSafeArea()
                    if let movie = vm.movie.value {
                        ScrollView(showsIndicators: false) {
                            LazyVStack(alignment: .leading) {
                                let keyYoutube = movie.trailer.keyPath
                                let backdropUrl = Constants.imgUrl+(movie.backdropPath)
                                let backdropWidth = proxy.size.width
                                let backdropHeight = backdropWidth * 0.65
                                
                                if keyYoutube != "" {
                                    YoutubeVideo(key: keyYoutube)
                                        .frame(width: backdropWidth, height: backdropHeight)
                                } else {
                                    WebImage(url: URL(string: backdropUrl))
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .opacity(0.4)
                                        .frame(width: backdropWidth, height: backdropHeight)
                                }
                                let imageUrl = Constants.imgUrl+(movie.posterPath)
                                let imageWidth = proxy.size.width * 0.4
                                let imageHeight = imageWidth * 1.5
                                HStack(alignment: .top, spacing: 30) {
                                    WebImage(url: URL(string: imageUrl))
                                        .resizable()
                                        .indicator(.progress)
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: imageWidth, height: imageHeight)
                                        .cornerRadius(10)
                                    //                                    Spacer()
                                    VStack(alignment: .leading, spacing: 30){
                                        
                                        Text("\(movie.title)")
                                            .font(.largeTitle)
                                            .bold()
                                            .lineLimit(2)
                                        
                                        Text("Release: \(movie.releaseDate)")
                                            .font(.caption)
                                            .bold()
                                            .lineLimit(1)
                                    }
                                    .padding(.top, 90)
                                }
                                .padding(.horizontal, 20)
                                .padding(.top, -90)
                                
                                Text("Synopsis")
                                    .font(.title)
                                    .bold()
                                    .padding(.top, 25)
                                    .padding(.horizontal, 20)
                                
                                Text("\(movie.description)")
                                    .font(.callout)
                                    .padding(.top, 5)
                                    .padding(.horizontal, 20)
                                
                                Text("Casts")
                                    .font(.title)
                                    .bold()
                                    .padding(.top, 25)
                                    .padding(.horizontal, 20)
                                ScrollView(.horizontal, showsIndicators: false) {
                                    HStack (spacing: 18) {
                                        ForEach(movie.casts, id: \.id) { cast in
                                            VStack(alignment: .leading, spacing: 5) {
                                                let profileUrl = Constants.imgUrl+cast.profilePath
                                                WebImage(url: URL(string: profileUrl))
                                                    .resizable()
                                                    .scaledToFill()
                                                    .frame(width: 90, height: 100)
                                                    .clipShape(
                                                        Circle()
                                                    )
                                                Text(cast.name)
                                                    .font(.caption)
                                                    .bold()
                                                    .lineLimit(1)
                                            }
                                            .frame(width: 90)
                                        }
                                    }
                                }
                                .padding(.horizontal, 20)
                            }
                            .frame(width: proxy.size.width)
                        }
//                        .ignoresSafeArea(.all, edges: .top)
                        .navigationTitle("\(movie.title)")
                        .navigationBarTitleDisplayMode(.inline)
                    } else {
                        progressView
                    }
                }
                .onAppear {
                    vm.getMovieDetail()
                }
            }
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                }
            }
        }
    }
    
    var progressView: some View {
        Rectangle()
        .fill(.gray)
        .opacity(0.2)
        .frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
        .cornerRadius(20)
        .overlay(
            ProgressView()
        )
    }

}

#Preview {
    let movie: Movie = Movie(ranking: 0, movieID: 1175161, title: "Agak Laen", posterPath: "/lUOwyPbDD9Agl3pHQVHGbZE0TvI.jpg", backdropPath: "/l756OAKA9N6qnJifFe9mABtm2Cc.jpg", releaseDate: "2024-02-01", description: "Four friends who set up a haunted house ride at the night market which unfortunately didn\'t sell, found the body of an old man who had a heart disease and they decided to bury his body in the haunted house and it turned out to be a spooky haunted house that sold well.", adult: false, duration: 119, country: "", productionHouse: "", trailer: Xisflix.MovieVideo(name: "", platform: "", keyPath: "", type: ""), casts: [Xisflix.MovieCast( name: "Mamat Alkatiri", popularity: 10.795, nameCharacter: "Beben", departement: "Acting", profilePath: "/hi0khIdfKtR5dRB8jXwLTvis5Sl.jpg")], rating: 8.0)
    let assembler: Assembler = AppAssembler.shared
    return DetailView(vm: assembler.resolve(movie: movie))
}
