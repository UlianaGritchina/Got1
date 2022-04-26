//
//  TFeldsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

struct TFeldsView: View {
    @Binding var players: [String]
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        HStack {
            VStack {
                ForEach(1...4, id: \.self) { index  in
                    TextField("Player \(index)", text: $players[index - 1])
                        .keyboardType(.default)
                        .disableAutocorrection(true)
                    
                        .frame(width: width / 2.2, height: height / 20)
                        .font(.system(size: height / 30))
                        .multilineTextAlignment(.center)
                    
                }
            }
            VStack {
                ForEach(5...8, id: \.self) { index in
                    TextField("Player \(index)", text: $players[index - 1])
                        .frame(width: width / 2.2, height: height / 20)
                        .font(.system(size: height / 30))
                        .multilineTextAlignment(.center)
                }
            }
        }
        
    }
}

struct TFeldsView_Previews: PreviewProvider {
    static var previews: some View {
        TFeldsView(players: .constant(["","","","","","","",""]))
    }
}


