//
//  HomeView.swift
//  Xisflix
//
//  Created by Muhammad Fahmi on 07/02/24.
//

import SwiftUI
import SDWebImageSwiftUI

struct HomeView: View {
    
    @StateObject var vm: HomePresenter
    @State var movieSelected: Movie?
    @State var showDetail: Bool = false
    @State var showType: Bool = false
    @State private var hideBar = false
    
    let router: HomeRouter
    
    var body: some View {
        NavigationView {
            GeometryReader { proxy in
                let contentWidth = proxy.size.width
                ZStack {
                    Color.background.ignoresSafeArea(.all)
                    ScrollView(showsIndicators: false) {
                       
                        let width = contentWidth * 0.35
                        let height = width * 1.5
                        
                        VStack(alignment: .leading) {
                            
                            Text("Trending Movie")
                                .font(.title)
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                            
                            LazyHStack(alignment: .top, spacing: 0) {
                                TabView {
                                    ForEach(vm.movieTrending.value ?? [Movie](), id: \.id) { movie in
                                        MovieHeadlineCard(heightImage: height, movie: movie)
                                            .frame(width: contentWidth, height: height)
                                            .onTapGesture {
                                                movieSelected = movie
                                                showDetail = true
                                            }
                                    }
                                }
                                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))
                                .frame(width: contentWidth, height: contentWidth * 0.7)
                                .padding(.top, -25)
                            }
                            
                            Text("Latest Indonesia")
                                .font(.title)
                                .bold()
                                .padding(.top, 10)
                                .padding(.horizontal, 10)
                            
                            ScrollView(.horizontal, showsIndicators: false) {
                                let width = contentWidth * 0.35
                                let height = width * 1.5
                                LazyHStack(alignment: .top, spacing: 25) {
                                    ForEach(vm.movieID.value ?? [Movie](), id: \.id) { movie in
                                       MovieCard(movie: movie, heightImage: height)
                                            .frame(width: width, height: height+38)
                                            .onTapGesture {
                                                movieSelected = movie
                                                showDetail = true
                                            }
                                    }
                                }
                            }
                            .padding(.horizontal, 10)
                            
                            Text("Popular")
                                .font(.title)
                                .bold()
                                .padding(.top, 15)
                                .padding(.horizontal, 10)
                            
                            let width = contentWidth * 0.45
                            let height = width * 1.5
                            let gridItem = [
                                GridItem(.adaptive(minimum: width, maximum: height))
                            ]
                            LazyVGrid(columns: gridItem, spacing: 20) {
                                ForEach(vm.moviePopular.value ?? [Movie](), id: \.id) { movie in
                                   MovieCard(movie: movie, heightImage: height)
                                        .frame(width: width, height: height+38)
                                        .onTapGesture {
                                            movieSelected = movie
                                            showDetail = true
                                        }
                                }
                            }
                        }
                    }
                }
                .fullScreenCover(item: $movieSelected, content: { item in
                    router.routeToDetail(movie: item)
                })
                .onAppear {
                    vm.getMovieListTrending()
                    vm.getMovieListID()
                    vm.getMovieListPopular()
                }
            }
            .navigationTitle("XisFlix")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {
                        print("navigate to menu")
                    }, label: {
                        Image(systemName: "line.3.horizontal")
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                }
                
                ToolbarItem(placement: .navigationBarTrailing) {
                    NavigationLink(destination: {
                        router.routeToSearch()
                    }, label: {
                        Image(systemName: "magnifyingglass")
                            .foregroundColor(.white)
                            .font(.headline)
                    })
                }
            }
        }
    }
}

#Preview {
    let assembler: Assembler = AppAssembler.shared
    let presenter: HomePresenter = assembler.resolve()
    let router: HomeRouter = assembler.resolve()
    return HomeView(vm: presenter, router: router)
}
