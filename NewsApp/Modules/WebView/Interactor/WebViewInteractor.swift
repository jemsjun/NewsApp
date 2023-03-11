//
//  WebViewInteractor.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol WebViewInteractorProtocol {
    var presenter: WebViewPresenterProtocol? { get set }
}

class WebViewInteractor: WebViewInteractorProtocol {
    var presenter: WebViewPresenterProtocol?
}
