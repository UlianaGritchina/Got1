//
//  GlassRectangelView.swift
//  Gotq
//
//  Created by Ульяна Гритчина on 06.04.2022.
//

import SwiftUI

struct GlassRectangleView: View {
    let width: CGFloat
    let height: CGFloat
    var body: some View {
        ZStack {
            LinearGradient(colors: [.gray, .gray.opacity(0.3)],
                           startPoint: .topLeading,
                           endPoint: .bottomTrailing)
                .mask(RoundedRectangle(cornerRadius: 20)
                    .stroke(.white, lineWidth: 0.5)
                    .cornerRadius(20)
                        .frame(width: width, height: height))
            
            Rectangle()
                .background(.ultraThinMaterial)
                .frame(width: width, height: height)
                .cornerRadius(20)
                .opacity(0.1)
        }
        .frame(width: width + 2, height: height + 2)
        
        
    }
}

struct GlassRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        GlassRectangleView(width: 200, height: 200)
    }
}
