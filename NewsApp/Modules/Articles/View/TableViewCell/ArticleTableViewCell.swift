//
//  ArticleTableViewCell.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit

class ArticleTableViewCell: UITableViewCell {
    static let identifier: String = "ArticleTableViewCell"
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var newsImageView: UIImageView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var authorLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var article: Article? {
        didSet {
            if let imageUrl = article?.urlToImage {
                newsImageView.loadImage(from: URL(string: imageUrl)!)
            } else {
                newsImageView.image = TheConstantManager.imagePlaceholder
            }
            sourceLabel.text = article?.source?.name
            titleLabel.text = article?.title
            if let author = article?.author {
                authorLabel.text = author
            } else {
                authorLabel.text = article?.source?.name
            }
            dateLabel.text = article?.publishedAt?.formatDate(format: .displayDate)
            descriptionLabel.text = article?.description
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        
        containerView.roundViewCorner(cornerRadius: 6, borderWidth: 1, borderColor: .black)
    }
}
