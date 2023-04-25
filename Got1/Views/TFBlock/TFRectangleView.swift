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
            
            TFeldsView(players: $players)
                .background {
                    ZStack {
                        LinearGradient(colors: [.gray, .gray.opacity(0.3)],
                                       startPoint: .topLeading,
                                       endPoint: .bottomTrailing)
                        .mask(RoundedRectangle(cornerRadius: 20)
                            .stroke(.white, lineWidth: 1)
                        )
                        
                        Rectangle()
                            .background(.ultraThinMaterial)
                        
                            .cornerRadius(20)
                            .opacity(0.1)
                    }
                }
        }
    }
}

struct TFRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        TFRectangleView(players:.constant(["","","","","","","",""]))
    }
}

