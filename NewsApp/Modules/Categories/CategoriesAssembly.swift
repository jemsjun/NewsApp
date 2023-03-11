//
//  CategoriesAssembly.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

class CategoryAssembly {
    static func assemble() -> UIViewController {
        let view = CategoriesViewController()
        let interactor = CategoriesInteractor()
        let presenter = CategoriesPresenter()
        let router = CategoriesRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}
