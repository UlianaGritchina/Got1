//
//  GameDetailView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 26.04.2022.
//

import SwiftUI

struct GameDetailsView: View {
    let gameDetails: GameDetails = GameDetails(
        addition: .danceWithDragons,
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
                Color(.black).ignoresSafeArea()
                BackgoundView(isShowingSupportView: false)
                VStack() {
                    
                    HStack {
                        Text(gameDetails.addition.rawValue)
                            .font(.system(size: height / 40))
                            .foregroundColor(.gray)
                        Spacer()
                    }
                    .padding(.top, -height / 40)
                    .padding(.horizontal, 5)
                    
                    
                    ZStack {
                        Rectangle()
                            .frame(width: width - 40, height: height / 15)
                            .opacity(0)
                            .background(.ultraThinMaterial)
                            .opacity(0.5)
                            .cornerRadius(10)
                        HStack {
                            Image(systemName: "crown.fill")
                                .font(.system(size: height / 45))
                                .foregroundColor(.yellow)
                            
                            Text("name")
                                .bold()
                                .font(.system(size: height / 30))
                            
                            Image(systemName: "crown.fill")
                                .font(.system(size: height / 45))
                                .foregroundColor(.yellow)
                        }.padding()
                    }
                    
                    Spacer()
                    
                    VStack {
                        HStack {
                            Text("\(gameDetails.players.count) Игроков").bold()
                            Spacer()
                            Text("Замки").bold()
                        }.font(.system(size: height / 35))
                        
                        ForEach(gameDetails.players, id: \.self) { player in
                            VStack {
                                RoundedRectangle(cornerRadius: 2)
                                    .frame(width: width - 80, height: 1)
                                    .foregroundColor(.gray)
                                    .opacity(0.5)
                                HStack {
                                    Text("\(player.name) \(player.house)").bold()
                                    Spacer()
                                    Text("\(player.castlesCount)").bold()
                                }.font(.system(size: height / 45))
                                
                            }
                        }
                        
                    }
                    .frame(width: width - 70, height: height / 2)
                    .background(
                        Rectangle()
                            .frame(width: width - 40, height: height / 2)
                            .opacity(0)
                            .background(.ultraThinMaterial)
                            .opacity(0.5)
                            .cornerRadius(10)
                    )
                    
                    Spacer()
                    
                    VStack(alignment: .leading) {
                        Text("Финальный раунд - \(gameDetails.finalRound)")
                            .font(.system(size: height / 45))
                        
                        Text("Время: \(gameDetails.time)")
                            .font(.system(size: height / 45))
                            .foregroundColor(.gray)
                        
                        Text("\(gameDetails.date)")
                            .font(.system(size: height / 45))
                            .foregroundColor(.gray)
                    }
                    .frame(width: width - 70, height: height / 10)
                    .background(
                        Rectangle()
                            .frame(width: width - 40, height: height / 10)
                            .opacity(0)
                            .background(.ultraThinMaterial)
                            .opacity(0.5)
                            .cornerRadius(10)
                    )
                    
                    
                }.padding()
            }
            .navigationTitle("Детали игры")
        }
        .preferredColorScheme(.dark)
    }
}

struct GameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        GameDetailsView()
    }
}
