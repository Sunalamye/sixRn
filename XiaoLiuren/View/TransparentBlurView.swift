//
//  TransparentBlurView.swift
//  XiaoLiuren
//
//  Created by Suoie on 2023/6/30.
//

import SwiftUI

struct TransparentBlurView: UIViewRepresentable {
    var removeAllFilter = false
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        DispatchQueue.main.async {
            if let backdropLayer = uiView.layer.sublayers?.first{
                if removeAllFilter{
                    backdropLayer.filters = []
                }else{
                    backdropLayer.filters?.removeAll(where: { filter in
                        String(describing: filter) != "gaussianBlur"
                    })
                }
            }
        }
    }
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .systemUltraThinMaterial))
        
        return view
    }
    
    
}

struct TransparentBlurModifier: ViewModifier {
    var removeAllFilter = false

    func body(content: Content) -> some View {
        content
            .background(
                TransparentBlurView(removeAllFilter: removeAllFilter)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .edgesIgnoringSafeArea(.all)
            )
    }
}

extension View {
    func transparentBlur(removeAllFilter: Bool = false) -> some View {
        self.modifier(TransparentBlurModifier(removeAllFilter: removeAllFilter))
    }
}
