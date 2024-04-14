//
//  ProductRowView.swift
//  Async_Await_CallAPI
//
//  Created by macOS on 14/04/2024.
//

import SwiftUI

struct ProductRowView: View {
    let product: Product
    var body: some View {
        HStack(spacing: 8) {
            if let url = URL(string: product.image) {
               productImage(url: url)
                
                VStack(alignment: .leading, spacing: 8) {
                    Text(product.title)
                        .font(.headline)
                    HStack {
                        Text(product.category)
                            .font(.subheadline)
                        .foregroundColor(Color.secondary)
                        Spacer()
                        HStack {
                            Image(systemName: "star.fill")
                            Text(product.rating.rate.toString())
                                
                        }
                        .fontWeight(.medium)
                        .foregroundColor(.yellow)
                    }
                    //Description
                    Text(product.description)
                        .font(.footnote)
                        .foregroundStyle(.secondary)
                        .lineLimit(3)
                    //Price and Buy button
                    HStack {
                        Text(product.price.currencyFormat())
                            .font(.title3)
                            .foregroundStyle(.indigo)
                        Spacer()
                        buyButton
                    }
                }
            }
        }
        .padding()
    }
    func productImage(url: URL) -> some View {
        AsyncImage(url: url) { image in
            image.resizable()
                .scaledToFit()
        } placeholder: {
            ProgressView()
        }
        .frame(width: 100, height: 100)
    }
    var buyButton : some View {
        Button(action: {}) {
            Text("Buy")
                .foregroundStyle(.white)
                .padding(.horizontal)
                .padding(.vertical,8)
                .background(.indigo)
                .clipShape(Capsule())
        }
    }
}

struct ProductRowView_Previews: PreviewProvider {
    static var previews: some View {
        ProductRowView(product: Product.dumy)
    }
}
