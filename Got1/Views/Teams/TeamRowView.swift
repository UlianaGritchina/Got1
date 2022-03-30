//
//  TeamRowView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 30.03.2022.
//

import SwiftUI

struct TeamRowView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width - 40, height: height / 4)
                .foregroundColor(.black)
                .opacity(0.4)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width - 40, height: height / 4)
                .background(.ultraThinMaterial)
                .opacity(0.2)
                .cornerRadius(20)
            LinearGradient(colors: [.white,.gray], startPoint: .top, endPoint: .bottom)
                .mask(   RoundedRectangle(cornerRadius: 20)
                            .stroke())
            
                .frame(width: width - 40, height: height / 4)
        }
        .overlay(
            
            VStack {
                Text("Team name")
                    .bold()
                    .font(.system(size: height / 30))
                    .foregroundColor(.green.opacity(0.7))
                Text("addition")
                    .font(.system(size: height / 40))
                Spacer()
                VStack(spacing: 10) {
                    Text("Uliana Kirll Serega Ilya")
                    Text("Uliana Kirll Serega Ilya")
                } .font(.system(size: height / 35))
                Spacer()
                HStack {
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                       Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                            .opacity(0.7)
                    }
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                        Text("Play")
                            .bold()
                            .font(.system(size: height / 35))
                        
                    }
                }
            }.padding()
            
        )
        
    }
}

struct TeamRowView_Previews: PreviewProvider {
    static var previews: some View {
        TeamRowView()
    }
}
