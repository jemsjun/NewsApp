//
//  ArticleListInteractor.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol ArticleListInteractorProtocol {
    var presenter: ArticleListPresenterProtocol? { get set }
    
    func getArticlesBySource()
}

class ArticleListInteractor: ArticleListInteractorProtocol {
    var presenter: ArticleListPresenterProtocol?
    var apiManager: NetworkManager?
    var selectedSource: Source?
    
    init(source: Source) {
        selectedSource = source
    }
    
    func getArticlesBySource() {
        guard let sourceId = selectedSource?.id else { return }
        
        apiManager?.getArticleList(source: sourceId, completion: { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let articles):
                        self?.presenter?.apiFetchSuccess(data: articles.articles ?? [])
                case .failure(let error):
                    self?.presenter?.handleError(error: error)
                }
            }
        })
    }
}
