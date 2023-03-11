//
//  SourceListAssembly.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

class SourceListAssembly {
    static func assemble(cat: String) -> UIViewController {
        let view = SourceListViewController()
        let interactor = SourceInteractor(category: cat)
        let presenter = SourcePresenter()
        let router = SourceRouter()
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
