//
//  SearchView.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 08/02/24.
//

import SwiftUI

struct SearchView: View {
    
    @Environment(\.dismiss) var dismiss
    @StateObject var vm: SearchPresenter
    @State var movieSelected: Movie?
    @State private var query: String = ""
    
    let router: SearchRouter
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                VStack {
                    HStack {
                        Image(systemName: "arrow.backward")
                            .onTapGesture {
                                dismiss()
                            }
                        HStack {
                            Image(systemName: "magnifyingglass")
                            TextField("Search your movie", text: $query, onCommit: {
                                vm.setMovieQuery(query: query.lowercased())
                                vm.getMovieSearchList()
                            })
                                .textInputAutocapitalization(.never)
                                .autocorrectionDisabled()
                                .keyboardType(.default)
                            Image(systemName: "x.circle")
                                .onTapGesture {
                                    query = ""
                                }
                        }
                        .padding()
                        .overlay( /// apply a rounded border
                            RoundedRectangle(cornerRadius: 18)
                                .stroke(Color.gray.opacity(0.5), lineWidth: 1)
                        )
                    }
                    
                    if vm.movieSearch.isLoading {
                        progressView
                        .offset(y: UIScreen.main.bounds.height/2-100)
                    } else if let movie = vm.movieSearch.value {
                        ScrollView(showsIndicators: false) {
                            let contentWidth = proxy.size.width
                            let width = contentWidth * 0.38
                            let height = width * 1.5
                            let gridItem = [
                                GridItem(.adaptive(minimum: width, maximum: height))
                            ]
                            LazyVGrid(columns: gridItem, spacing: 20) {
                                ForEach(movie, id: \.id) { movie in
                                    MovieCard(movie: movie, heightImage: height)
                                         .frame(width: width, height: height+38)
                                         .onTapGesture {
                                             movieSelected = movie
                                         }
                                }
                            }
                        }
                        .padding(.vertical, 20)
                    } else if vm.movieSearch == .empty {
                        VStack(spacing: 25) {
                            Image(systemName: "film.fill")
                                .font(.largeTitle)
                            Text("Movie not found")
                                .font(.headline)
                                .bold()
                        }
                        .offset(y: UIScreen.main.bounds.height/2-100)
                    } else {
                        VStack(spacing: 25) {
                            Image(systemName: "film.fill")
                                .font(.largeTitle)
                            Text("Find your Favorite movie")
                                .font(.headline)
                                .bold()
                        }
                        .offset(y: UIScreen.main.bounds.height/2-100)
                    }
                }
                .padding(.horizontal, 20)
                .frame(width: proxy.size.width)
                .fullScreenCover(item: $movieSelected, content: { item in
                    router.routeToDetail(movie: item)
                })
                .hiddenNavigationBarStyle()
            }
        }
    }
    
    var progressView: some View {
        Rectangle()
        .fill(.gray)
        .opacity(0.2)
        .frame(width: 100, height: 100)
        .cornerRadius(20)
        .overlay(
            ProgressView()
        )
    }
    
}

#Preview {
    let assembler: Assembler = AppAssembler.shared
    let presenter: SearchPresenter = assembler.resolve()
    let router: SearchRouter = assembler.resolve()
    return SearchView(vm: presenter, router: router)
}
