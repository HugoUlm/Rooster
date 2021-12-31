//
//  StoreView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-28.
//

import SwiftUI
import SDWebImageSwiftUI

struct StoreView: View {
    
    @ObservedObject var viewModel = StoreViewModel()
    
    var body: some View {
        Group {
            VStack(alignment: .leading) {
                Text("NIKE")
                    .font(.system(size: 20))
                    .offset(x: 15, y: 0)
                ScrollView(.horizontal) {
                    nikeView(viewModel: viewModel)
                }
            }
            .offset(x: 0, y: 0)
        }
        
        Spacer()
            .frame(height: 50)
        
        Group {
            VStack(alignment: .leading) {
                Text("PUMA")
                    .font(.system(size: 20))
                    .offset(x: 15, y: 0)
                ScrollView(.horizontal) {
                    pumaView(viewModel: viewModel)
                }
            }
            .offset(x: 0, y: 0)
        }


                
        }
    init() {
        viewModel.getProducts()
    }
}



@ViewBuilder
func nikeView(viewModel: StoreViewModel) -> some View {
    HStack {
        ForEach(viewModel.products, id: \.id) { product in
            if product.brand == "Nike" {
                VStack {

                    AnimatedImage(url: URL(string: product.image))
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)

                    HStack {
                        VStack(alignment: .leading, content: {
                            Text("$" + String(product.price))
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text(product.model.uppercased())
                                .font(.title2)
                                .foregroundColor(.primary)
                        })
                        .layoutPriority(100)

                        Spacer()
                    }
                    .padding()
                }
                .frame(width: 200, height: 250)
                .cornerRadius(10)
                .overlay (
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(UIColor.gray), lineWidth: 1)
                )
                    .padding([.top, .horizontal])
            }

        }
    }
}

@ViewBuilder
func pumaView(viewModel: StoreViewModel) -> some View {
    HStack {
        ForEach(viewModel.products, id: \.id) { product in
            if product.brand == "Puma" {
                VStack {

                    AnimatedImage(url: URL(string: product.image))
                        .resizable()
                        .aspectRatio(1, contentMode: .fit)

                    HStack {
                        VStack(alignment: .leading, content: {
                            Text("$" + String(product.price))
                                .font(.headline)
                                .foregroundColor(.secondary)
                            Text(product.model.uppercased())
                                .font(.title2)
                                .foregroundColor(.primary)
                        })
                        .layoutPriority(100)

                        Spacer()
                    }
                    .padding()
                }
                .frame(width: 200, height: 250)
                .cornerRadius(10)
                .overlay (
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color(UIColor.gray), lineWidth: 1)
                )
                    .padding([.top, .horizontal])
            }

        }
    }
}


struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
