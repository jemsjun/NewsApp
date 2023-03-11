//
//  ArticleListViewController.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit

protocol ArticleListViewProtocol {
    var presenter: ArticleListPresenterProtocol? { get set }
    
    func loadData(data: [Article])
    func showError()
}

class ArticleListViewController: UIViewController, ArticleListViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataView: UIView!
    
    var presenter: ArticleListPresenterProtocol?
    var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchArticles()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: ArticleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.identifier)
    }

    private func fetchArticles() {
        presenter?.fetchArticles()
    }
    
    internal func loadData(data: [Article]) {
        articles = data
        noDataView.isHidden = data.count != 0
        
        tableView.reloadData()
    }
    
    internal func showError() {
        noDataView.isHidden = false
        showError(message: TheConstantManager.globalErrorMsg)
    }
}

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return articles.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as! ArticleTableViewCell
        cell.article = articles[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.viewArticleDetail(article: articles[indexPath.row])
    }
}

