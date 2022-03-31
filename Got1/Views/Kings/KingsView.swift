//
//  KingsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 28.03.2022.
//

import SwiftUI

struct KingsView: View {
    @StateObject var viewModel = KingsViewViewModel()
    let king = Player(name: "a", house: "d")
    var body: some View {
        NavigationView {
            
            List {
                Button(action: {
                    viewModel.addKing(player: king)
                }) {
                    Text("Button")
                }
                ForEach(viewModel.kings) { king in
                    Text(king.name ?? "sg")
                        .foregroundColor(.white)
                }
            }
            .navigationTitle("Kings")
        }
    }
}

struct KingsView_Previews: PreviewProvider {
    static var previews: some View {
        KingsView()
            .preferredColorScheme(.dark)
    }
}
