//
//  NetworkManager.swift
//  NewsApp
//
//  Created by James Junior on 11/03/23.
//

import Foundation

protocol NetworkManagerProtocol {
    func parseData< T: Codable>(data: Data, modelType: T.Type) -> Result<T, Error>
    func networkRequest<T: Codable> (from endpoint: String, modelType: T.Type, completion: @escaping (Result<T, Error>) -> ())
}

class NetworkManager: NetworkManagerProtocol {
    func networkRequest<T: Codable> (from endpoint: String, modelType: T.Type, completion:   @escaping (Result<T, Error>) -> ()) {
        guard let url = URL(string: "\(endpoint)") else {
            completion(.failure(NSError(domain: "empty", code: 0, userInfo: [:])))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
            if let error = error {
                debugPrint(error.localizedDescription)
                completion(.failure(error))
            }
            
            guard let data = data else {
            completion(.failure(NSError(domain: "data is empty", code: 0, userInfo: [:])))
                return
            }
            
            completion(self.parseData(data: data, modelType: T.self))
        }
        task.resume()
    }
    
    func parseData< T: Codable>(data: Data, modelType: T.Type) -> Result<T, Error> {
        let decoder = JSONDecoder()
        
        do {
            let result = try decoder.decode(T.self, from: data)
            return .success(result)
        } catch {
            print("error while decoding data", error)
            return .failure(error)
        }
    }
}

extension NetworkManager {
    func getSourceList(category: String, completion: @escaping (Result<Sources, Error>) -> ()) {
        let url = TheConstantManager.BASE_URL + "/sources?category=\(category)" + TheConstantManager.API_KEY_QUERY
        networkRequest(from: url, modelType: Sources.self, completion: completion)
    }
    
    func getArticleList(source: String, completion: @escaping (Result<Articles, Error>) -> ()) {
        let url = TheConstantManager.BASE_URL + "/everything?sources=\(source)" + TheConstantManager.API_KEY_QUERY
        networkRequest(from: url, modelType: Articles.self, completion: completion)
    }
    
    func getAllSource(completion: @escaping (Result<Sources, Error>) -> ()) {
        let url = TheConstantManager.BASE_URL + "/sources" + TheConstantManager.API_KEY_QUERY.replacingOccurrences(of: "&", with: "?")
        networkRequest(from: url, modelType: Sources.self, completion: completion)
    }
    
    func getArticleListBySearchQuery(query: String, completion: @escaping (Result<Articles, Error>) -> ()) {
        let url = TheConstantManager.BASE_URL + "/everything?q=\(query)" + TheConstantManager.API_KEY_QUERY
        networkRequest(from: url, modelType: Articles.self, completion: completion)
    }
}

