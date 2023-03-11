//
//  SearchAssembly.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

class SearchAssembly {
    static func assemble() -> UIViewController {
        let view = SearchViewController()
        let interactor = SearchInteractor()
        let presenter = SearchPresenter()
        let router = SearchRouter()
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
