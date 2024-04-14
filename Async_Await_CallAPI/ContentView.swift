//
//  ContentView.swift
//  Async_Await_CallAPI
//
//  Created by macOS on 12/04/2024.
//

import SwiftUI

struct ContentView: View {
    let viewModel = ProductViewModel()
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
        .task {
            await viewModel.fetchProducts()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
