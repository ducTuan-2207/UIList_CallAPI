//
//  APIManager.swift
//  Async_Await_CallAPI
//
//  Created by macOS on 13/04/2024.
//

import Foundation
enum networkError:Error {
    case invalidURL
    case invalidReponse
}

final class APIManager {
    func request<T: Decodable>(url: String) async throws -> T {
        guard let url = URL(string: url) else {
           throw networkError.invalidURL
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        

        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            throw networkError.invalidReponse
        }
        return try JSONDecoder().decode(T.self, from: data)
    }

        
    
}
