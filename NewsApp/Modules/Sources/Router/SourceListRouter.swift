//
//  SourceListRouter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

protocol SourceRouterProtocol {
    var view: UIViewController? { get set }
    
    func createArticlesListPage(source: Source)
}

class SourceRouter: SourceRouterProtocol {
    var view: UIViewController?
    
    func createArticlesListPage(source: Source) {
        let articleListAssembly = ArticleListAssembly.assemble(source: source)
        articleListAssembly.title = "Articles from \(source.name ?? "")"
        view?.navigationController?.pushViewController(articleListAssembly, animated: true)
    }
}
