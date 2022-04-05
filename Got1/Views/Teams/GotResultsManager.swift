//
//  GotResultsManager.swift
//  Gotq
//
//  Created by Ульяна Гритчина on 05.04.2022.
//

import Foundation

class GotResultsManager {
    
    let playersNames: [String]
    let addition: Additions
    
    init(playersNames: [String], addition: Additions) {
        self.playersNames = playersNames
        self.addition = addition
    }
    
    private var playersForGame: [String] = []
    private var resultPlayers: [Player] = []
    private var houses: [String] = []
    
    @Published var result = Resalt(players: [], addition: "")
    
    func getResult() {
        getPlayersForGame()
        
        switch addition {
        case .base:
            houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell"]
            if (playersForGame.count > 2) && (playersForGame.count < 7) {
               makeResultsArray()
            }
            result = Resalt(players: resultPlayers, addition: addition.rawValue)
            
        case .motherOfDragons:
            houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell","Arryn"]
            houses.shuffle()
            if (playersForGame.count > 2) {
                if playersForGame.count != 3 {
                    playersForGame.shuffle()
                    let targarien = Player(name: playersNames[0], house: "Targarien")
                    playersForGame.remove(at: 0)
                    makeResultsArray()
                    resultPlayers.append(targarien)
                    resultPlayers = resultPlayers.reversed()
                } else {
                    makeResultsArray()
                    result = Resalt(players: resultPlayers, addition: addition.rawValue)
                }
                result = Resalt(players: resultPlayers, addition: addition.rawValue)
            }
            
        case .feastOfRavens:
            houses = ["Arryn","Stark","Lannister","Barateon"]
            if playersForGame.count == 4 {
                makeResultsArray()
                result = Resalt(players: resultPlayers, addition: addition.rawValue)
            }
        case .danceWithDragons:
            houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell"]
            if playersForGame.count == 6 {
                makeResultsArray()
                result = Resalt(players: resultPlayers, addition: addition.rawValue)
            }
        }
    }
    
    private func makeResultsArray() {
        resultPlayers.removeAll()
        for index in 0..<playersForGame.count {
            resultPlayers.append(Player(name: playersForGame[index],
                                        house: houses[index]))
        }
    }
    
    private func getPlayersForGame() {
        for player in playersNames {
            if player != "" {
                playersForGame.append(player)
            }
        }
        playersForGame.shuffle()
    }
    
}
