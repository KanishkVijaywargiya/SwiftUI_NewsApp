//
//  HomeView.swift
//  NewsApp
//
//  Created by KANISHK VIJAYWARGIYA on 06/09/21.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openURL
    @StateObject var viewModel = NewsViewModelImpl(service: NewsServiceImpl())
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading: ProgressView()
            case .failed(let error): ErrorView(error: error, handler: viewModel.getArticles)
            case .success(let articles):
                NavigationView {
                    List(articles) { item in
                        ArticleView(article: item)
                            .onTapGesture {
                                loadURL(url: item.url)
                            }
                    }
                    .navigationTitle(Text("News"))
                }
            }
        }
        .onAppear(perform: viewModel.getArticles)
    }
    
    func loadURL(url: String?) {
        guard let link = url,
              let url = URL(string: link) else { return }
        
        openURL(url)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
