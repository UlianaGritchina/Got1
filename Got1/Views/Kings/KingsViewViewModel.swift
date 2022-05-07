//
//  KingsViewViewModel.swift
//  Got1
//
//  Created by Ульяна Гритчина on 29.03.2022.
//

import Foundation

class KingsViewViewModel: ObservableObject {
    
    @Published var kings: [King] = CoreDataManager.shered.savedKings
    @Published var king = Player(name: "", house: "Дом")
    @Published var addition = "Дополнение"
    @Published var isShowNewKingCard = false
    @Published var count = 0
    
    let houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell", "Arryn", "Targarien"]
    let additions = ["Base","Mother of Dragons","Feast of Ravens","Dance with Dragons"]
    
    func addKing() {
        CoreDataManager.shered.addKing(player: king, addition: addition)
        //count += 1
        updateKings()
    }
    
    func deleteKing(king: King) {
        count -= 1
        CoreDataManager.shered.deleteKing(king: king)
        updateKings()
    }

    func updateKings() {
        CoreDataManager.shered.fetchKings()
        kings = CoreDataManager.shered.savedKings
    }
    
    func clearData() {
        king = Player(name: "", house: "Дом")
        addition = "Дополнение"
    }
    
}
