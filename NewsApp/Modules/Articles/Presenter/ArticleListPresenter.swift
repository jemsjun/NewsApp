//
//  ArticleListPresenter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol ArticleListPresenterProtocol {
    var router: ArticleListRouterProtocol? { get set }
    var view: ArticleListViewProtocol? { get set }
    var interactor: ArticleListInteractorProtocol? { get set }
    
    func fetchArticles()
    func apiFetchSuccess(data: [Article])
    func handleError(error: Error)
    func viewArticleDetail(article: Article)
}

class ArticleListPresenter: ArticleListPresenterProtocol {
    var router: ArticleListRouterProtocol?
    var view: ArticleListViewProtocol?
    var interactor: ArticleListInteractorProtocol?
    
    func fetchArticles() {
        interactor?.getArticlesBySource()
    }
    
    func apiFetchSuccess(data: [Article]) {
        view?.loadData(data: data)
    }
    
    func handleError(error: Error) {
        view?.showError()
    }
    
    func viewArticleDetail(article: Article) {
        router?.createWebView(article: article)
    }
}
