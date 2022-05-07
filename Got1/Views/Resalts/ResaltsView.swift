//
//  ResaltsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

struct ResaltsView: View {
    let resalt: Resalt
    
    var body: some View {
        NavigationView {
            ZStack {
                Back(title: resalt.addition.rawValue)
                ScrollView(showsIndicators: false) {
                    ForEach(resalt.players, id: \.self) { player in
                        HouseRow(player: player).padding()
                    }
                }
            }
            .navigationTitle(resalt.addition.rawValue)
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ResaltsView_Previews: PreviewProvider {
    static var previews: some View {
        ResaltsView(resalt: Resalt(
            players: [Player(name: "sdfg", house: "Barateon")],
            addition: .danceWithDragons)
        )
            .preferredColorScheme(.dark)
    }
}

struct Back: View {
    let title: String
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        RadialGradient(colors: [Color(title).opacity(0.5), .black], center: .center, startRadius: 20, endRadius: width * 1.3)
            .ignoresSafeArea()
            .opacity(0.8)
    }
}

struct HouseRow: View {
    let player: Player
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            HStack {
                Image(player.house)
                    .resizable()
                    .frame(width: width / 5 , height: height / 10)
                    .cornerRadius(15)
                
                VStack(alignment: .leading) {
                    Text(player.name)
                        .bold()
                        .font(.system(size: height / 30))
                    Text(player.house)
                        .font(.system(size: height / 30))
                }
                Spacer()
            }
            .frame(width: width - 80, height: height / 10)
            
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("\(player.house)"))
                .frame(width: width - 80, height: height / 10)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
        }
    }
}











struct HouseShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX + 50, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - 50, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX - 50, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + 50, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX + 50, y:rect.minY))
            
        }
    }
}






