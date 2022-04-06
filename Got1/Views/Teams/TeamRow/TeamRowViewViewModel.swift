//
//  TeamRowViewViewModel.swift
//  Gotq
//
//  Created by Ульяна Гритчина on 06.04.2022.
//

import Foundation

class TeamRowViewViewModel: ObservableObject {
    
    @Published var result: Resalt = Resalt(players: [], addition: "")
    @Published var isShowResultsView = false
    
    private var gotManager = GotResultsManager(playersNames: [], addition: "")
    
    func getRsult(players: [String], addition: String) {
        gotManager = GotResultsManager(playersNames: players, addition: addition)
        gotManager.getResult()
        result = gotManager.result
    }
    
}
