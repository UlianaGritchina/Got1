//
//  TFRectangleView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

struct TFRectangleView: View {
    @Binding var players: [String]
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple.opacity(0.5),.blue, .white], startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask( RoundedRectangle(cornerRadius: 20)
                        .stroke(.white, lineWidth: 1)
                        .frame(width: width - 40, height: height * 0.3)
                        .opacity(0.8))
            
            Rectangle()
                .background(.ultraThinMaterial)
                .frame(width: width - 40, height: height * 0.3)
                .cornerRadius(20)
                .opacity(0.1)
                .blur(radius: 1)
            TFeldsView(players: $players)
        }
    }
}

struct TFRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        TFRectangleView(players:.constant(["","","","","","","",""]))
    }
}
