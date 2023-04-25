//
//  BackgoundView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 07.05.2022.
//

import SwiftUI

struct BackgoundView: View {
    let isShowingSupportView: Bool
    var body: some View {
        ZStack {
            LinearGradient(colors: [.black,.blue],
                           startPoint: .bottomLeading,
                           endPoint: .topTrailing)
            Circles()
        }
        .ignoresSafeArea()
        .blur(radius: 39)
        .opacity(isShowingSupportView ? 0.1 : 0.2)
        .animation(.default, value: isShowingSupportView)
    }
}

struct BackgoundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgoundView(isShowingSupportView: false)
    }
}

struct Circles: View {
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            Circle()
                .foregroundColor(.green)
                .ignoresSafeArea()
                .frame(width: width / 2)
                .offset(x: width / 2, y: 0)
            
            Circle()
                .foregroundColor(.blue)
                .ignoresSafeArea()
                .frame(width: width / 1)
                .offset(x: -width / 2, y: 0)
            
            Circle()
                .foregroundColor(.purple)
                .ignoresSafeArea()
                .frame(width: width / 1.5)
                .offset(x: width / 4, y: height / 3)
            
            Circle()
                .foregroundColor(.red)
                .ignoresSafeArea()
                .frame(width: width / 2)
                .offset(x: width / 2, y: -height / 2)
        }
        .blur(radius: 40)
    }
}
