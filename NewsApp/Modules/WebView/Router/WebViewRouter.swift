//
//  WebViewRouter.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

protocol WebViewRouterProtocol {
    var view: UIViewController? { get set }
}

class WebViewRouter: WebViewRouterProtocol {
    var view: UIViewController?
}
