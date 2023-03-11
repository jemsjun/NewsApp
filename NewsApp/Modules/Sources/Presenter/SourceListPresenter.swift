//
//  SourceListPresenter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol SourcePresenterProtocol {
    var router: SourceRouterProtocol? { get set }
    var view: SourceListViewProtocol? { get set }
    var interactor: SourceInteractorProtocol? { get set }
    
    func fetchNewsSources()
    func apiFetchSuccess(data: [Source])
    func handleError(error: Error)
    func navigateToArticleList(source: Source)
}

class SourcePresenter: SourcePresenterProtocol {
    var router: SourceRouterProtocol?
    var view: SourceListViewProtocol?
    var interactor: SourceInteractorProtocol?
    
    func fetchNewsSources() {
        interactor?.getSourceListFromAPI()
    }
    
    func apiFetchSuccess(data: [Source]) {
        view?.loadData(data: data)
    }
    
    func handleError(error: Error) {
        view?.showError()
    }
    
    func navigateToArticleList(source: Source) {
        router?.createArticlesListPage(source: source)
    }
}
