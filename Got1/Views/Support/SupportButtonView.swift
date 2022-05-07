//
//  SupportButtonView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 07.05.2022.
//

import SwiftUI

struct SupportButtonView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @Binding var isShowingSupportView: Bool
    var body: some View {
        Button(action: {isShowingSupportView.toggle()}) {
            Image("support")
                .resizable()
                .scaledToFit()
                .clipShape(Circle())
        }
        .shadow(color: isShowingSupportView ? .red : .white,
                radius: 5, x: 0, y: 0)
        .frame(width: width / 18, height: width / 8)
        .padding()
    }
}

struct SupportButtonView_Previews: PreviewProvider {
    static var previews: some View {
        SupportButtonView(isShowingSupportView: .constant(false))
    }
}
