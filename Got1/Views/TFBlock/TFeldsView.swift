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
    @FocusState private var focusedField: Int?
    var body: some View {
        HStack {
            VStack {
                ForEach(1...4, id: \.self) { index  in
                    TextField("Игрок \(index)", text: $players[index - 1])
                        .submitLabel(.next)
                        .focused($focusedField, equals: index)
                        .frame(width: width / 2.2, height: height / 20)
                        .font(.system(size: height / 30))
                        .multilineTextAlignment(.center)
                }
            }
            
            VStack {
                ForEach(5...8, id: \.self) { index in
                    TextField("Игрок \(index)", text: $players[index - 1])
                        .submitLabel(index == 8 ? .done : .next)
                        .focused($focusedField, equals: index)
                        .frame(width: width / 2.2, height: height / 20)
                        .font(.system(size: height / 30))
                        .multilineTextAlignment(.center)
                }
            }
        }
        .onSubmit {
            switch focusedField {
            case 1: focusedField = 2
            case 2: focusedField = 3
            case 3: focusedField = 4
            case 4: focusedField = 5
            case 5: focusedField = 6
            case 6: focusedField = 7
            case 7: focusedField = 8
            default: focusedField = nil
            }
        }
        
    }
}

struct TFeldsView_Previews: PreviewProvider {
    static var previews: some View {
        TFeldsView(players: .constant(["","","","","","","",""]))
    }
}


