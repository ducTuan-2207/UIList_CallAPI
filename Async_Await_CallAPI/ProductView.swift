//
//  ProductView.swift
//  Async_Await_CallAPI
//
//  Created by macOS on 14/04/2024.
//

import SwiftUI

struct ProductView: View {
    
    @StateObject var ViewModel = ProductViewModel()
    
    var body: some View {
        NavigationStack {
          
                List(ViewModel.product) {product in
                    ProductRowView(product: product)
                    
                }
                .listStyle(.plain)
            .navigationTitle(Text("Product"))
        }
        
        .task {
            await ViewModel.fetchProducts()
        }
    }
}

struct ProductView_Previews: PreviewProvider {
    static var previews: some View {
        ProductView()
    }
}
