//
//  StartAnimatedBgView.swift
//  Rooster
//
//  Created by Hugo Bäckman Ulmgren on 2021-12-24.
//

import Foundation
import SwiftUI
import FLAnimatedImage

struct StartAnimatedBgView : UIViewRepresentable {
    
    let animatedView = FLAnimatedImageView()
    var fileName : String
    
    func makeUIView(context: UIViewRepresentableContext<StartAnimatedBgView>) -> some UIView {
        let view = UIView()
        
        let path : String = Bundle.main.path(forResource: fileName, ofType: "gif")!
        let url = URL(fileURLWithPath: path)
        let gifData = try! Data(contentsOf: url)
        let gif = FLAnimatedImage(animatedGIFData: gifData)
        animatedView.animatedImage = gif
        
        animatedView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(animatedView)
        
        NSLayoutConstraint.activate([
            animatedView.heightAnchor.constraint(equalTo: view.heightAnchor),
            animatedView.widthAnchor.constraint(equalTo: view.widthAnchor)
        ])
        
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: UIViewRepresentableContext<StartAnimatedBgView>) {
        // COmment
    }
}
