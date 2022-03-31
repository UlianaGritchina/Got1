//
//  KingsViewViewModel.swift
//  Got1
//
//  Created by Ульяна Гритчина on 29.03.2022.
//

import Foundation

class KingsViewViewModel: ObservableObject {
    
    @Published var kings: [King] = CoreDataManager.shered.savedKings
    @Published var king = Player(name: "", house: "house")
    @Published var addition = "addition"
    @Published var isShowNewKingCard = false
    
    let houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell", "Arryn", "Targarien"]
    let additions = ["Base","Mother of Dragons","Feast of Ravens","Dance with Dragons"]
    
    func addKing() {
        CoreDataManager.shered.addKing(player: king, addition: addition)
        updateKings()
    }

    func updateKings() {
        CoreDataManager.shered.fetchKings()
        kings = CoreDataManager.shered.savedKings
    }
    
}
