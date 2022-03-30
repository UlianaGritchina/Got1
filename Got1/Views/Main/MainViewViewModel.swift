//
//  MainViewViewModel.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import Foundation
import SwiftUI

enum Additions: String {
    case base = "Base"
    case motherOfDragons = "Mother of Dragons"
    case feastOfRavens = "Feast of Ravens"
    case danceWithDragons = "Dance with Dragons"
}

class MainViewViewModel: ObservableObject {
    @Published var players = ["","","","","","","",""]
    @Published var showAdditions = false
    @Published var showResaltsView = false
    @Published var showAlert = false
    @Published var selectedAddition = "Base"
    @Published var addition: Additions = .base
    @Published var resaltPlayers: [Player] = []
    @Published var resalt: Resalt = Resalt(players: [], addition: "")
    private var playersForGame: [String] = []
    private var houses: [String] = []
    
    func togleShowAdditons() {
        showAdditions.toggle()
    }
    
    func togleShowResaltsView() {
        if !resaltPlayers.isEmpty {
            showResaltsView.toggle()
        } else {
            showAlert.toggle()
        }
    }
    
    func chuseAdditions(addition: Additions) {
        self.addition = addition
    }
    
    func getResalts() {
        getPlayersArray()
        resaltPlayers.removeAll()
        switch addition {
        case .base:
            houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell"]
            if (playersForGame.count > 2) && (playersForGame.count < 7) {
                makeResalts()
            }
            
        case .motherOfDragons:
            houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell", "Arryn"]
            houses.shuffle()
            if playersForGame.count > 2 {
                let targarien = Player(name: playersForGame[0],
                                       house: "Targarien")
                playersForGame.remove(at: 0)
                makeResalts()
                resaltPlayers.append(targarien)
                resaltPlayers = resaltPlayers.reversed()
                resalt = Resalt(players: resaltPlayers, addition: addition.rawValue)
            }
        case .feastOfRavens:
            houses = ["Arryn","Stark","Lannister","Barateon"]
            if playersForGame.count == 4 {
                makeResalts()
            }
        case .danceWithDragons:
            houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell"]
            if playersForGame.count == 6 {
                makeResalts()
            }
        }
    }
    
    private func getPlayersArray() {
        playersForGame.removeAll()
        for player in players {
            if player != "" {
                playersForGame.append(player)
            }
        }
        playersForGame.shuffle()
    }
    
    private func makeResalts() {
        for index in 0..<playersForGame.count {
            resaltPlayers.append(Player(name: playersForGame[index],
                                  house: houses[index]))
        }
        resalt = Resalt(players: resaltPlayers, addition: addition.rawValue)
        playersForGame.removeAll()
    }
    
}
