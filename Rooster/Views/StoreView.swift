//
//  StoreView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-28.
//

import SwiftUI
import WebKit

struct StoreView: View {
    
    @ObservedObject var viewModel = StoreViewModel()
    
    var body: some View {
        
        ForEach(viewModel.products, id: \.id) { product in
            VStack {
                Text("NIKE")
                    .font(.system(size: 20))
                Text("PUMA")
                    .font(.system(size: 20))
            }

            HStack {
                if product.brand == "Nike" {
                    ZStack {
                        Image(uiImage: viewModel.dataIsValid ? viewModel.imageFromData(): UIImage())
                            .resizable()
                            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text(product.model)
                    }

                    .onAppear {
                        viewModel.loadImage(url: product.image)
                    }
                }
            }
            HStack {
                if product.brand == "Puma" {
                    ZStack {
                        Image(uiImage: viewModel.dataIsValid ? viewModel.imageFromData(): UIImage())
                            .resizable()
                            .frame(width: 200, height: 200, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                        Text(product.model)
                    }
                    
                    .onAppear {
                        viewModel.loadImage(url: product.image)
                    }
                }
            }
        }
    }

    init() {
        viewModel.getProducts()
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
