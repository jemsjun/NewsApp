//
//  CategoriesPresenter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol CategoriesPresenterProtocol {
    var router: CategoriesRouterProtocol? { get set }
    var view: CategoriesViewProtocol? { get set }
    var interactor: CategoriesInteractorProtocol? { get set }
    
    func navigateToSourceList(category: String)
}

class CategoriesPresenter: CategoriesPresenterProtocol {
    var router: CategoriesRouterProtocol?
    var view: CategoriesViewProtocol?
    var interactor: CategoriesInteractorProtocol?
    
    func navigateToSourceList(category: String) {
        router?.createSourcePage(category: category)
    }
}
