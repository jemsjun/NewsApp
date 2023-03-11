//
//  ArticleListAssembly.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

class ArticleListAssembly {
    static func assemble(source: Source) -> UIViewController {
        let view = ArticleListViewController()
        let interactor = ArticleListInteractor(source: source)
        let presenter = ArticleListPresenter()
        let router = ArticleListRouter()
        let apiManager = NetworkManager()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        interactor.apiManager = apiManager
        
        router.view = view
        
        return view
    }
}
