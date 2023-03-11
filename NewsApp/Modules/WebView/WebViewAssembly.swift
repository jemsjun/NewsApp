//
//  WebViewAssembly.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

class WebViewAssembly {
    static func assemble(article: Article) -> UIViewController {
        guard let url = article.url else { return UIViewController() }
        
        let view = WebViewController()
        let interactor = WebViewInteractor()
        let presenter = WebViewPresenter(url: url)
        let router = WebViewRouter()
        
        view.presenter = presenter
        
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        
        interactor.presenter = presenter
        
        router.view = view
        
        return view
    }
}
