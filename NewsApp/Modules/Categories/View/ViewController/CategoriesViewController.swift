//
//  CategoriesViewController.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit

protocol CategoriesViewProtocol {
    var presenter: CategoriesPresenterProtocol? { get set }
}

class CategoriesViewController: UIViewController, CategoriesViewProtocol {
    @IBOutlet weak var collectionView: UICollectionView!
    
    var presenter: CategoriesPresenterProtocol?
    var categories: [String] = ["business", "entertainment", "general", "health", "science", "sports", "technology"]

    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
    }

    func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: CategoryCollectionViewCell.identifier, bundle: nil), forCellWithReuseIdentifier: CategoryCollectionViewCell.identifier)
    }
}

extension CategoriesViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identifier, for: indexPath) as! CategoryCollectionViewCell
        cell.categoryName = categories[indexPath.row]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellWidth = (collectionView.frame.size.width / 2) - 5
        let cellHeight = cellWidth / 2
        return CGSize(width: cellWidth, height: cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        presenter?.navigateToSourceList(category: categories[indexPath.row])
    }
}
