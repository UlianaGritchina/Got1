//
//  ButtonAdditionView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

struct ButtonView: View {
    let title: String
    let action: () -> Void
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Button(action: action) {
            ZStack {
               RoundedRectangle(cornerRadius: 20)
                    .stroke()
                Text(title)
                    .bold()
                    .font(.system(size: height / 40))
            }
            .frame(width: width / 1.5, height: height / 16)
        }
    }
}

struct AdditionButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(title: "A", action: {})
    }
}
