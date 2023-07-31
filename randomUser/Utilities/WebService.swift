//
//  WebService.swift
//  randomUser
//
//  Created by Santiago del Castillo Gonzaga on 28/07/23.
//

import Foundation

enum WebServiceError: Error {
    case badUrlError
    case parsingJsonError
    case noDataError
}

protocol WebServiceProtocol {
    func fetchRandomUser(handler: @escaping (Result<RandomUser, WebServiceError>) -> Void)
}

class WebService: WebServiceProtocol {
    static let shared: WebService = WebService()
    let path = "https://randomuser.me/api/"
    
    func fetchRandomUser(handler: @escaping (Result<RandomUser, WebServiceError>) -> Void) {
        guard let url = URL(string: path) else {
            handler(.failure(.badUrlError))
            return
        }
        
        let request = URLRequest(url: url)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard error == nil, let data = data else {
                handler(.failure(.noDataError))
                return
            }
            
            do {
                let randomUser = try self.decodeRandomUser(from: data)
                handler(.success(randomUser))
            } catch {
                handler(.failure(.parsingJsonError))
            }
        }
        .resume()
    }
    
    private func decodeRandomUser(from data: Data) throws -> RandomUser {
        let response = try JSONDecoder().decode(RandomUserResponse.self, from: data)
        if let randomUser = response.results.first {
            return randomUser
        }
        
        throw DecodingError.valueNotFound(RandomUser.self, DecodingError.Context(codingPath: [], debugDescription: "No random user found in the response."))
    }
}
