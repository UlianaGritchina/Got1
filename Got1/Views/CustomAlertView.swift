//
//  CustomAlertView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 28.03.2022.
//

import SwiftUI

struct CustomAlertView: View {
    let addition: Additions
    @Binding var show: Bool
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        Rectangle()
            .opacity(0)
            .background(.ultraThinMaterial)
            .cornerRadius(20)
            .overlay(
                VStack {
                    Text("Wrong players count")
                        .font(.system(size: height / 35))
                        .padding()
                    
                    Spacer()
                    Text("For game \(addition.rawValue)")
                        .font(.system(size: height / 45))
                    
                    HStack {
                        Text("You need")
                        switch addition {
                        case .base:
                            Text("3...6")
                        case .motherOfDragons:
                            Text("3...8")
                        case .feastOfRavens:
                            Text("4")
                        case .danceWithDragons:
                            Text("6")
                        }
                        Text("players")
                    }.font(.system(size: height / 45))

                    Spacer()
                    Button("OK") {show.toggle()}
                    .padding()
                })
            .frame(width: width - 80, height: height / 5)
            .opacity(show ? 1 : 0)
            .animation(.default, value: show)
    }
}

struct CustomAlertView_Previews: PreviewProvider {
    static var previews: some View {
        CustomAlertView(addition: .base, show: .constant(true))
    }
}
