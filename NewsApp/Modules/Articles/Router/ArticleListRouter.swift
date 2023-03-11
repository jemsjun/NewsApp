//
//  ArticleListRouter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

protocol ArticleListRouterProtocol {
    var view: UIViewController? { get set }
    
    func createWebView(article: Article)
}

class ArticleListRouter: ArticleListRouterProtocol {
    var view: UIViewController?
    
    func createWebView(article: Article) {
        let webViewAssembly = WebViewAssembly.assemble(article: article)
        view?.navigationController?.pushViewController(webViewAssembly, animated: true)
    }
}
