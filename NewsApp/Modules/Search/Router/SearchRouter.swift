//
//  SearchRouter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

protocol SearchRouterProtocol {
    var view: UIViewController? { get set }
    
    func sourceNavigation(source: Source)
    func articleNavigation(article: Article)
}

class SearchRouter: SearchRouterProtocol {
    var view: UIViewController?
    
    func sourceNavigation(source: Source) {
        let articleListAssembly = ArticleListAssembly.assemble(source: source)
        articleListAssembly.title = "Articles from \(source.name ?? "")"
        view?.navigationController?.pushViewController(articleListAssembly, animated: true)
    }
    
    func articleNavigation(article: Article) {
        let webViewAssembly = WebViewAssembly.assemble(article: article)
        view?.navigationController?.pushViewController(webViewAssembly, animated: true)
    }
}
