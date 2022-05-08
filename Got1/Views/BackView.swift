//
//  BackView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 27.03.2022.
//

import SwiftUI

struct BackView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            Circle()
                .frame(width: width * 0.8 , height: width)
                .foregroundColor(.blue)
                .blur(radius: 100)
                .offset(x: width / 2, y: 0)
            
            
            Color(.black)
                .ignoresSafeArea()
                .opacity(0.6)
            
            LinearGradient(colors: [.red.opacity(0.3),.purple,.blue],
                           startPoint: .bottom,
                           endPoint: .top)
                .opacity(0.2)
                .ignoresSafeArea()
        }
        
    }
}

struct BackView_Previews: PreviewProvider {
    static var previews: some View {
        BackView()
    }
}
