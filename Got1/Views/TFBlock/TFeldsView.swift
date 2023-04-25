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
        VStack {
            ForEach(1...8, id: \.self) { index  in
                TextField("Игрок \(index)", text: $players[index - 1])
                    .submitLabel(.next)
                    .focused($focusedField, equals: index)
                    .font(.system(size: height / 35))
            }
        }
        .padding(.vertical, 10)
        .padding(.horizontal, 15)
        .frame(maxWidth: .infinity, alignment: .leading)
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


