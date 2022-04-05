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
    @Published var resalt: Resalt = Resalt(players: [], addition: "")

    private var gotManager = GotResultsManager(playersNames: [], addition: .base)
    
    func getResult() {
        gotManager = GotResultsManager(playersNames: players, addition: addition)
        gotManager.getResult()
        resalt = gotManager.result
    }
    
    func togleShowAdditons() {
        showAdditions.toggle()
    }
    
    func togleShowResaltsView() {
        showResaltsView.toggle()
    }
    
    func chuseAdditions(addition: Additions) {
        self.addition = addition
    }
    
}
