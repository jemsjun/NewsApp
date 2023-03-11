//
//  Extensions.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit

extension UIView {
    func roundViewCorner(cornerRadius: CGFloat, borderWidth:CGFloat, borderColor:UIColor) {
        self.layer.borderWidth = borderWidth
        self.layer.masksToBounds = false
        self.layer.borderColor = borderColor.cgColor
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true
    }
}

extension UIImageView {
    func loadImage(from url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
}

extension String {
    func formatDate(format: ConstantManager.DateFormat) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.calendar = Calendar(identifier: .gregorian)
        dateFormatter.locale = Locale(identifier: "en_us_POSIX")
        dateFormatter.dateFormat = ConstantManager.DateFormat.dateWithTimeZone.rawValue
        if let theDate = dateFormatter.date(from: self) {
            dateFormatter.dateFormat = format.rawValue
            return dateFormatter.string(from: theDate)
        } else {
            return ""
        }
    }
}

extension UIViewController {
    func showError(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
}
