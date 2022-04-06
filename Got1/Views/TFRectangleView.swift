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
            GlassRectangleView(width: width - 40, height: height * 0.3)
           
            TFeldsView(players: $players)
        }
    }
}

struct TFRectangleView_Previews: PreviewProvider {
    static var previews: some View {
        TFRectangleView(players:.constant(["","","","","","","",""]))
    }
}

