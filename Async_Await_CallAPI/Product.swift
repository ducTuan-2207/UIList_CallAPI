//
//  Product.swift
//  Async_Await_CallAPI
//
//  Created by macOS on 13/04/2024.
//

import Foundation

struct Product:Decodable {
    let id: Int
    let title, description, category, image: String
    let price: Double
    let rating: Rate
}
struct Rate:Decodable {
    let rate: Double
    let count: Int
}
