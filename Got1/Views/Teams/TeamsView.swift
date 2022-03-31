//
//  TeamsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 30.03.2022.
//

import SwiftUI

struct TeamsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var isShowAlert = false
    var body: some View {
        NavigationView {
            ZStack {
                BackView()
                
                VStack {
                    ScrollView {
                        ForEach(0..<5) { _ in
                            TeamRowView().padding()
                        }
                    }
                }
                
            }
            .navigationTitle("Teams")
            .toolbar { Button(action: {isShowAlert.toggle()}) {
                ZStack {
                    Circle()
                        .frame(width: width / 9, height: width / 9)
                        .opacity(0.5)
                    Image(systemName: "plus.diamond.fill")
                        .foregroundColor(.white)
                }
            }
            }
        }
        .preferredColorScheme(.dark)
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
