//
//  GameDetailView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 26.04.2022.
//

import SwiftUI

struct GameDetailsView: View {
    let gameDetails: GameDetails = GameDetails(
        addition: .motherOfDragons,
        players: [DetailPlayer(name: "aaa", house: "bbb", castlesCount: "5"),
                  DetailPlayer(name: "aaa", house: "bbb", castlesCount: "2"),
                  DetailPlayer(name: "aaa", house: "bbb", castlesCount: "5"),
                  DetailPlayer(name: "aaa", house: "bbb", castlesCount: "5"),
                  DetailPlayer(name: "aaa", house: "bbb", castlesCount: "7"),
                  DetailPlayer(name: "aaa", house: "bbb", castlesCount: "5"),
                  DetailPlayer(name: "aaa", house: "bbb", castlesCount: "5"),
                  DetailPlayer(name: "aaa", house: "bbb", castlesCount: "7")],
        
        finalRound: "7",
        time: "123",
        date: Date())
    
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    
    var body: some View {
        NavigationView {
            ZStack {
                
                VStack() {
                    
                    Text(gameDetails.addition.rawValue)
                        .foregroundColor(gameDetails.addition != .feastOfRavens
                                         ? Color(gameDetails.addition.rawValue)
                                         : Color(.gray))
                        .bold()
                        .font(.system(size: height / 30))
                    
                    
                    Text("King: name")
                        .bold()
                        .font(.system(size: height / 35))
                        .padding()
                    
                    VStack {
                        HStack {
                            Text("\(gameDetails.players.count) Players").bold()
                            Spacer()
                            Text("Castles").bold()
                        }.font(.system(size: height / 35))
                        
                        ForEach(gameDetails.players, id: \.self) { player in
                            VStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: width - 40, height: 1)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                                HStack {
                                    Text("\(player.name) \(player.house)").bold()
                                    Spacer()
                                    Text("\(player.castlesCount)").bold()
                                }.font(.system(size: height / 45))
                                
                            }
                        }
                        
                    }.padding()
                    
                    Text("Final round - \(gameDetails.finalRound)")
                        .font(.system(size: height / 45))
                    
                    Text("Time: \(gameDetails.time)")
                        .font(.system(size: height / 45))
                        .foregroundColor(.gray)
                    
                    
                    HStack {
                        Text("Date: \(gameDetails.date)")
                            .font(.system(size: height / 45))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    
                    
                    
                    Spacer()
                }.padding()
            }
            .navigationTitle("Game Details")
        }
        .preferredColorScheme(.dark)
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView()
    }
}
