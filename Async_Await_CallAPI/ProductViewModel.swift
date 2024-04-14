//
//  ProductViewModel.swift
//  Async_Await_CallAPI
//
//  Created by macOS on 14/04/2024.
//

import Foundation

class ProductViewModel {
    var product: [Product] = []
    private let manager = APIManager()
    
    func fetchProducts() async {
        do {
            let responseProduct: [Product] = try await manager.request(url: "https://fakestoreapi.com/products")
            print(responseProduct)
        } catch {
            print("Fetch error", error)
        }
    }
}
