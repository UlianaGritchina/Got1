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
    @Published var isShowingResaltsView = false
    @Published var isShowingAlert = false
    @Published var isShowingSupportView = false
    @Published var addition: Additions = .base
    @Published var resalt: Resalt = Resalt(players: [], addition: .base)
    var additions: [Additions] = [.base, .motherOfDragons, .feastOfRavens, .danceWithDragons]
    
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
    
    func togleShowResaltsView() {
        if !resalt.players.isEmpty {
            isShowingResaltsView.toggle()
        } else {
            isShowingAlert.toggle()
        }
    }
    
    func chuseAdditions(addition: Additions) {
        self.addition = addition
    }
    
}
