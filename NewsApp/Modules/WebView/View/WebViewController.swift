//
//  WebViewController.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit
import WebKit

protocol WebViewProtocol {
    var presenter: WebViewPresenterProtocol? { get set }
}

class WebViewController: UIViewController, WebViewProtocol, WKUIDelegate {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var toolbarView: UIView!
    @IBOutlet weak var previousPageButton: UIButton!
    @IBOutlet weak var nextPageButton: UIButton!
    @IBOutlet weak var refreshButton: UIButton!
    
    var webView: WKWebView!
    var presenter: WebViewPresenterProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()

        setupWebview()
    }
    
    fileprivate func enableTheButton(isForward : Bool) {
        if isForward {
            nextPageButton.isEnabled = true
            nextPageButton.setImage(TheConstantManager.chevronNext, for: .normal)
        }else {
            previousPageButton.isEnabled = true
            previousPageButton.setImage(TheConstantManager.chevronPrev, for: .normal)
        }
    }
    
    fileprivate func disableTheButton(isForward : Bool) {
        if isForward {
            nextPageButton.isEnabled = true
            nextPageButton.setImage(TheConstantManager.disabledChevronNext, for: .normal)
        } else {
            previousPageButton.isEnabled = true
            previousPageButton.setImage(TheConstantManager.disabledChevronPrev, for: .normal)
        }
    }
    
    func setupWebview() {
        webView = WKWebView(frame: containerView.bounds)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        containerView.addSubview(webView)
        
        loadURL(url: presenter?.getArticleUrl() ?? TheConstantManager.articleUrlPlaceholder)
    }
    
    func loadURL(url: String) {
        DispatchQueue.main.async { [weak self] in
            self?.webView.load(NSURLRequest(url: NSURL(string: url)! as URL) as URLRequest)
        }
    }
    
    @IBAction func previousPageButtonTapped(_ sender: Any) {
        if webView.canGoBack {
            webView.goBack()
        }
    }
    
    @IBAction func nextPageButtonTapped(_ sender: Any) {
        if webView.canGoForward {
            webView.goForward()
        }
    }
    
    @IBAction func refreshButtonTapped(_ sender: Any) {
        webView.reload()
    }
}

extension WebViewController: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        if self.webView.canGoBack {
            enableTheButton(isForward: false)
        }else {
            disableTheButton(isForward: false)
        }
        
        if self.webView.canGoForward {
            enableTheButton(isForward: true)
        }else {
            disableTheButton(isForward: true)
        }
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        if self.webView.canGoBack {
            enableTheButton(isForward: false)
        }else {
            disableTheButton(isForward: false)
        }
        
        if self.webView.canGoForward {
            enableTheButton(isForward: true)
        }else {
            disableTheButton(isForward: true)
        }
    }
}
