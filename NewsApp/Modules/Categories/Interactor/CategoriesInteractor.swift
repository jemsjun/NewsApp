//
//  CategoriesInteractor.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol CategoriesInteractorProtocol {
    var presenter: CategoriesPresenterProtocol? { get set }
}

class CategoriesInteractor: CategoriesInteractorProtocol {
    var presenter: CategoriesPresenterProtocol?
}
