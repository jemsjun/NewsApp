//
//  Sources.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

struct Sources: Codable {
    var status: String?
    var sources: [Source]?
}

struct Source: Codable {
    var id: String?
    var name: String?
    var description: String?
    var url: String?
    var category: String?
    var language: String?
    var country: String?
}
