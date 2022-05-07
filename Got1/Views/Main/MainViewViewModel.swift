//
//  MainViewViewModel.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import Foundation
import SwiftUI

enum Additions: String {
    case base = "База"
    case motherOfDragons = "Мать Драконов"
    case feastOfRavens = "Пир Воронов"
    case danceWithDragons = "Танец с Драконами"
}

class MainViewViewModel: ObservableObject {
    
    @Published var players = ["","","","","","","",""]
    var additions: [Additions] = [.base, .motherOfDragons, .feastOfRavens, .danceWithDragons]
    @Published var showAdditions = false
    @Published var showResaltsView = false
    @Published var showAlert = false
    @Published var showSupport = false
    @Published var selectedAddition = "Base"
    @Published var addition: Additions = .base
    @Published var resalt: Resalt = Resalt(players: [], addition: .base)
    
    private var gotManager = GotGeneratorManager(playersNames: [], addition: .base)
    
    func start() {
        UIApplication.shared.endEditing()
        getResult()
        togleShowResaltsView()
    }
    
    func getResult() {
        gotManager = GotGeneratorManager(playersNames: players, addition: addition)
        gotManager.getResult()
        resalt = gotManager.result
    }
    
    func togleShowAdditons() {
        showAdditions.toggle()
    }
    
    func togleShowResaltsView() {
        if !resalt.players.isEmpty {
            showResaltsView.toggle()
        } else {
            showAlert.toggle()
        }
    }
    
    func chuseAdditions(addition: Additions) {
        self.addition = addition
    }
    
  
    
}
