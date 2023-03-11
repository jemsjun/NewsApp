//
//  CategoryCollectionViewCell.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    static let identifier: String = "CategoryCollectionViewCell"
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var categoryLabel: UILabel!
    @IBOutlet weak var categoryImageView: UIImageView!
    
    var categoryName: String? {
        didSet {
            categoryLabel.text = categoryName?.capitalized
            categoryImageView.image = UIImage(named: categoryName ?? "")
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        containerView.roundViewCorner(cornerRadius: 6, borderWidth: 0, borderColor: .clear)
    }
}
