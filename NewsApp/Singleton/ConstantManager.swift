//
//  ConstantManager.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation
import UIKit.UIImage

let TheConstantManager = ConstantManager.shared

class ConstantManager {
    static let shared = ConstantManager()
    
    // MARK: API URLs & Keys
    let API_KEY: String = "e08a4fdc82624c2484b0a2040634289f"
    let BASE_URL: String = "https://newsapi.org/v2"
    let API_KEY_QUERY: String = "&apiKey=e08a4fdc82624c2484b0a2040634289f"
    
    // MARK: Fonts
    let boldFont = UIFont.boldSystemFont(ofSize: 16)
    
    // MARK: TabBar Icons
    let news: UIImage? = UIImage(systemName: "newspaper")
    let search: UIImage? = UIImage(systemName: "magnifyingglass")
    
    // MARK: WebView Icons
    let chevronNext: UIImage? = UIImage(systemName: "chevron.forward.circle.fill")
    let chevronPrev: UIImage? = UIImage(systemName: "chevron.backward.circle.fill")
    let disabledChevronNext: UIImage? = UIImage(systemName: "chevron.right.circle")
    let disabledChevronPrev: UIImage? = UIImage(systemName: "chevron.left.circle")
    
    // MARK: Placeholders
    let globalErrorMsg: String = "Something wrong happened"
    let articleUrlPlaceholder: String = "https://newsapi.org"
    let imagePlaceholder: UIImage? = UIImage(named: "img-placeholder")
}


extension ConstantManager {
    enum DateFormat: String {
        /// output: 2023-03-11T00:00:00Z
        case dateWithTimeZone = "yyyy-MM-dd'T'HH:mm:ssZ"
        /// output: 11 Mar 2023
        case displayDate = "d MMM yyyy"
    }
}
