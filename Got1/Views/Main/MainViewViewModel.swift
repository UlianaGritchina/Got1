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
    @Published var isShowSupportView = false
    @Published var showAlert = false
    @Published var selectedAddition = "Base"
    @Published var addition: Additions = .base
    @Published var resalt: Resalt = Resalt(players: [], addition: "")

    private var gotManager = GotResultsManager(playersNames: [], addition: "")
    
    func getResult() {
        gotManager = GotResultsManager(playersNames: players, addition: addition.rawValue)
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
