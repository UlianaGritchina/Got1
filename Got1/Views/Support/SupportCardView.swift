//
//  SupportCardView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 07.05.2022.
//

import SwiftUI

struct SupportCardView: View {
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    let isShow: Bool
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width - 80, height: height / 4)
                .foregroundColor(.yellow)
                .opacity(0)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            
            RoundedRectangle(cornerRadius: 20)
                .stroke(.yellow.opacity(0.5))
                .frame(width: width - 80, height: height / 4)
            
                .overlay(
                    VStack {
                        Text("Вы можете оказать подмогу приложению 💰")
                            .font(.system(size: height / 40))
                        Spacer()
                        TinkoffButton()
                    }.padding()
                )
            
            
        }
        .padding()
        .offset(x: 0, y: isShow ? 0 : -height)
        .animation(.spring(), value: isShow)
    }
}

struct SupportCardView_Previews: PreviewProvider {
    static var previews: some View {
        SupportCardView(isShow: true)
    }
}

struct TinkoffButton: View {
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        Button(action: {}) {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: width / 1.5, height: height / 20)
                    .foregroundColor(.yellow)
                    .opacity(0.8)
                
                Link(destination: URL(string: "https://www.tinkoff.ru/cf/1yvFPYgx2ff")!) {
                    Text("Tinkoff")
                        .bold()
                        .font(.system(size: height / 45))
                        .foregroundColor(.black)
                        .frame(width: width / 1.5, height: height / 20)
                }
            }
        }
    }
}
