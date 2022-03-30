//
//  AdditionsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

struct AdditionsView: View {
    @Binding var show: Bool
    let viewModel: MainViewViewModel
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    private let additions = [Additions.base,
                             Additions.motherOfDragons,
                             Additions.feastOfRavens ,
                             Additions.feastOfRavens]
    var body: some View {
        ZStack {
            Rectangle()
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .frame(width: width / 1.5, height: height / 3)
                .offset(x: 0, y: show ? 0 : height)
            
            VStack {
                Text("Chose addition")
                    .font(.system(size: height / 30))
                ForEach(additions, id: \.self) { addition in
                    Text(addition.rawValue)
                        .font(.system(size: height / 40))
                        .padding(10)
                        .onTapGesture {
                            viewModel.chuseAdditions(addition: addition)
                            show.toggle()
                        }
                }
            }
        }
        .offset(x: 0, y: show ? 0 : height)
        .animation(.spring(), value: show)
        
    }
}

struct AdditionsView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionsView(show: .constant(true), viewModel: MainViewViewModel())
    }
}
