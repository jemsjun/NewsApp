//
//  SearchPresenter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol SearchPresenterProtocol {
    var view: SearchViewProtocol? { get set }
    var interactor: SearchInteractorProtocol? { get set }
    var router: SearchRouterProtocol? { get set }
    
    func searchNewsFromAPI(type: SearchType, string: String)
    func apiSourceFetchSuccess(data: [Source])
    func apiArticleFetchSuccess(data: [Article])
    func handleError(error: Error)
    
    func handleSourceClick(source: Source)
    func handleArticleClick(article: Article)
}

class SearchPresenter: SearchPresenterProtocol {
    var view: SearchViewProtocol?
    var interactor: SearchInteractorProtocol?
    var router: SearchRouterProtocol?
    
    var searchString: String?
    
    func searchNewsFromAPI(type: SearchType, string: String) {
        searchString = string
        interactor?.getNewsFromAPI(type: type, string: string)
    }
    
    func apiSourceFetchSuccess(data: [Source]) {
        let filteredSource = data.filter { $0.name?.lowercased().contains(searchString?.lowercased() ?? "") == true }
        view?.loadSourcesResult(data: filteredSource)
    }
    
    func apiArticleFetchSuccess(data: [Article]) {
        view?.loadArticlesResult(data: data)
    }
    
    func handleError(error: Error) {
        view?.handleError()
    }
    
    func handleSourceClick(source: Source) {
        router?.sourceNavigation(source: source)
    }
    
    func handleArticleClick(article: Article) {
        router?.articleNavigation(article: article)
    }
}
