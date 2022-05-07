//
//  AdditionsMenuView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 07.05.2022.
//

import SwiftUI

struct AdditionsMenuView: View {
    @State var vm: MainViewViewModel
    @State private var title = "База"
    var body: some View {
        ZStack {
            Text(title)
                .foregroundColor(.blue)
                .bold()
            Menu("                ") {
                ForEach(vm.additions, id: \.self) { add in
                    Button(action: {
                        title = add.rawValue
                        vm.chuseAdditions(addition: add)
                    }) {
                        Text(add.rawValue)
                    }
                }
            }
        }
    }
}

struct AdditionsMenuView_Previews: PreviewProvider {
    static var previews: some View {
        AdditionsMenuView(vm: MainViewViewModel())
            .preferredColorScheme(.dark)
    }
}
