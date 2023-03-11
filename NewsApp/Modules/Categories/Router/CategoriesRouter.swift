//
//  CategoriesRouter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

protocol CategoriesRouterProtocol {
    var view: UIViewController? { get set }
    
    func createSourcePage(category: String)
}

class CategoriesRouter: CategoriesRouterProtocol {
    var view: UIViewController?
    
    func createSourcePage(category: String) {
        let sourceListAssembly = SourceListAssembly.assemble(cat: category)
        sourceListAssembly.title = "Sources for \(category.capitalized)"
        view?.navigationController?.pushViewController(sourceListAssembly, animated: true)
    }
}
