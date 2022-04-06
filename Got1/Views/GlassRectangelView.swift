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
            LinearGradient(colors: [.purple.opacity(0.5),.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask( RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 1)
                        .frame(width: width, height: height)
                    .opacity(0.8))
            Rectangle()
                .background(.ultraThinMaterial)
                .frame(width: width, height: height)
                .cornerRadius(20)
                .opacity(0.1)
                .blur(radius: 1)
        }.frame(width: width + 2, height: height + 2)
        
       
    }
}

struct GlassRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        GlassRectangleView(width: 200, height: 200)
    }
}
