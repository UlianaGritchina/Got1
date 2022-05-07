//
//  TeamRowViewViewModel.swift
//  Gotq
//
//  Created by Ульяна Гритчина on 06.04.2022.
//

import Foundation

class TeamRowViewViewModel: ObservableObject {
    
    @Published var result: Resalt = Resalt(players: [], addition: .base)
    @Published var isShowResultsView = false
    
    private var gotManager = GotGeneratorManager(playersNames: [], addition: .base)
    
    func getRsult(players: [String], addition: Additions) {
        gotManager = GotGeneratorManager(playersNames: players, addition: addition)
        gotManager.getResult()
        result = gotManager.result
       
    }
    
}
