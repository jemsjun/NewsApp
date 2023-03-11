//
//  SourceListViewController.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit

protocol SourceListViewProtocol {
    var presenter: SourcePresenterProtocol? { get set }
    
    func loadData(data: [Source])
    func showError()
}

class SourceListViewController: UIViewController, SourceListViewProtocol {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var noDataView: UIView!
    
    var presenter: SourcePresenterProtocol?
    var sources: [Source] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        fetchSourceData()
    }
    
    private func setupTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.separatorStyle = .none
        
        tableView.register(UINib(nibName: SourceTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: SourceTableViewCell.identifier)
    }
    
    private func fetchSourceData() {
        presenter?.fetchNewsSources()
    }
    
    internal func loadData(data: [Source]) {
        self.sources = data
        noDataView.isHidden = data.count != 0
        
        self.tableView.reloadData()
    }
    
    internal func showError() {
        noDataView.isHidden = false
        showError(message: TheConstantManager.globalErrorMsg)
    }
}

extension SourceListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.sources.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SourceTableViewCell.identifier, for: indexPath) as! SourceTableViewCell
        cell.data = self.sources[indexPath.row]
        cell.index = indexPath.row + 1
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        presenter?.navigateToArticleList(source: self.sources[indexPath.row])
    }
}

