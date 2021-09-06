//
//  NewsViewModel.swift
//  NewsApp
//
//  Created by KANISHK VIJAYWARGIYA on 06/09/21.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelImpl: ObservableObject, NewsViewModel {
    private let service: NewsService
    
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    
    @Published private(set) var state: ResultState = .loading
    
    init(service: NewsService) {
        self.service = service
    }
    
    func getArticles() {
        self.state = .loading
        
        let cancellable = service
            .request(from: .getNews)
            .sink { result in
                switch result {
                // send back the articles
                case .finished: self.state = .success(content: self.articles)
                // send back the error
                case .failure(let error): self.state = .failed(error: error)
                }
            } receiveValue: { response in
                self.articles = response.articles
            }
        
        self.cancellables.insert(cancellable)
    }
}
