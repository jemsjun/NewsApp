//
//  WebViewPresenter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol WebViewPresenterProtocol {
    var view: WebViewProtocol? { get set }
    var interactor: WebViewInteractorProtocol? { get set }
    var router: WebViewRouterProtocol? { get set }
    
    func getArticleUrl() -> String
}

class WebViewPresenter: WebViewPresenterProtocol {
    var view: WebViewProtocol?
    var interactor: WebViewInteractorProtocol?
    var router: WebViewRouterProtocol?
    
    var url: String
    
    init(url: String) {
        self.url = url
    }
    
    func getArticleUrl() -> String {
        return self.url
    }
}
