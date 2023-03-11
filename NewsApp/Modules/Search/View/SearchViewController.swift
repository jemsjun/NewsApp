//
//  SearchViewController.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit

enum SearchType {
    case source
    case article
}

protocol SearchViewProtocol {
    var presenter: SearchPresenterProtocol? { get set }
    
    func loadSourcesResult(data: [Source])
    func loadArticlesResult(data: [Article])
    func handleError()
}

class SearchViewController: UIViewController, SearchViewProtocol {
    @IBOutlet weak var searchByButton: UIButton!
    @IBOutlet weak var searchByLabel: UILabel! {
        didSet { searchByLabel.text = "News Source" }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var noDataView: UIView!
    
    var searchType: SearchType = .source
    var presenter: SearchPresenterProtocol?
    var sources: [Source] = []
    var articles: [Article] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearch()
        setupTableView()
    }
    
    func configureSearch() {
        var menuItems: [UIAction] {
            return [
                UIAction(title: "News Source", handler: { (_) in
                    self.searchType = .source
                    self.resetData()
                    self.searchByLabel.text = "News Source"
                    self.searchBar.placeholder = "Search source..."
                    self.searchBar.text = ""
                }),
                UIAction(title: "News Article", handler: { (_) in
                    self.searchType = .article
                    self.resetData()
                    self.searchByLabel.text = "News Article"
                    self.searchBar.placeholder = "Search article..."
                    self.searchBar.text = ""
                }),
            ]
        }

        var searchMenu: UIMenu {
            return UIMenu(title: "Search by", image: nil, identifier: nil, options: [], children: menuItems)
        }
        
        searchByButton.menu = searchMenu
        searchByButton.showsMenuAsPrimaryAction = true
        noDataView.isHidden = false
        searchBar.delegate = self
    }
    
    func resetData() {
        self.articles = []
        self.sources = []
        noDataView.isHidden = false
        
        self.tableView.reloadData()
    }
    
    func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: SourceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SourceTableViewCell.identifier)
        tableView.register(UINib(nibName: ArticleTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.identifier)
    }
    
    func loadSourcesResult(data: [Source]) {
        self.sources = data
        self.articles = []
        noDataView.isHidden = data.count != 0
        
        self.tableView.reloadData()
    }
    
    func loadArticlesResult(data: [Article]) {
        self.articles = data
        self.sources = []
        noDataView.isHidden = data.count != 0
        
        self.tableView.reloadData()
    }
    
    func handleError() {
        noDataView.isHidden = false
        showError(message: TheConstantManager.globalErrorMsg)
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if self.searchType == .source {
            return self.sources.count
        } else {
            return self.articles.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if self.searchType == .source {
            let cell = tableView.dequeueReusableCell(withIdentifier: SourceTableViewCell.identifier, for: indexPath) as! SourceTableViewCell
            cell.data = self.sources[indexPath.row]
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.identifier, for: indexPath) as! ArticleTableViewCell
            cell.article = self.articles[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if self.searchType == .source {
            presenter?.handleSourceClick(source: self.sources[indexPath.row])
        } else {
            presenter?.handleArticleClick(article: self.articles[indexPath.row])
        }
    }
}

extension SearchViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        self.searchNews(type: self.searchType, string: searchBar.text ?? "")
    }
    
    func searchNews(type: SearchType, string: String) {
        presenter?.searchNewsFromAPI(type: type, string: string)
    }
}
