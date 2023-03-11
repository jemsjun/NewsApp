//
//  SearchInteractor.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol? { get set }
    var apiManager: NetworkManager? { get set }
    
    func getNewsFromAPI(type: SearchType, string: String)
}

class SearchInteractor: SearchInteractorProtocol {
    var presenter: SearchPresenterProtocol?
    var apiManager: NetworkManager?
    
    func getNewsFromAPI(type: SearchType, string: String) {
        if type == .source {
            apiManager?.getAllSource(completion: { [weak self] result in
                DispatchQueue.main.async {
                    switch result {
                        case .success(let sources):
                            self?.presenter?.apiSourceFetchSuccess(data: sources.sources ?? [])
                        case .failure(let error):
                            self?.presenter?.handleError(error: error)
                    }
                }
            })
        } else {
            apiManager?.getArticleListBySearchQuery(query: string, completion: { [weak self] result in
                DispatchQueue.main.async { [weak self] in
                    switch result {
                        case .success(let articles):
                            self?.presenter?.apiArticleFetchSuccess(data: articles.articles ?? [])
                        case .failure(let error):
                            self?.presenter?.handleError(error: error)
                    }
                }
            })
        }
    }
}
