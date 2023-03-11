//
//  SourceTableViewCell.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import UIKit

class SourceTableViewCell: UITableViewCell {
    static let identifier: String = "SourceTableViewCell"
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var sourceLabel: UILabel!
    @IBOutlet weak var sourceNameLabel: UILabel!
    @IBOutlet weak var sourceDescLabel: UILabel!
    
    var data: Source? {
        didSet {
            sourceNameLabel.text = data?.name
            sourceDescLabel.text = data?.description
        }
    }
    
    var index: Int? {
        didSet { sourceLabel.text = "Source \(index ?? 1)" }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.selectionStyle = .none
        containerView.roundViewCorner(cornerRadius: 8, borderWidth: 0, borderColor: .clear)
    }
}
