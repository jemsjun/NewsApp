//
//  Articles.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

struct Articles: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

struct Article: Codable {
    let source: ArticleSource?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
}

struct ArticleSource: Codable {
    let id: String?
    let name: String?
}
