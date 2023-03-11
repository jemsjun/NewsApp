//
//  SourceListInteractor.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol SourceInteractorProtocol {
    var presenter: SourcePresenterProtocol? { get set }
    
    func getSourceListFromAPI()
}

class SourceInteractor: SourceInteractorProtocol {
    var apiManager: NetworkManager?
    var presenter: SourcePresenterProtocol?
    var selectedCategory: String?
    
    init(category: String = "") {
        selectedCategory = category
    }
    
    func getSourceListFromAPI() {
        guard let selectedCat = self.selectedCategory, selectedCat != "", apiManager != nil else { return }
        apiManager?.getSourceList(category: selectedCat) { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let sources):
                    self?.presenter?.apiFetchSuccess(data: sources.sources ?? [])
                case .failure(let error):
                    self?.presenter?.handleError(error: error)
                }
            }
        }
    }
}
