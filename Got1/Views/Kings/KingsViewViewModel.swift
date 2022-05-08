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
    @Published var addition = "База"
    @Published var isShowNewKingCard = false
    @Published var count = 0
    
    let houses = ["Баратеон","Старк","Ланнистер","Грейджой","Тирелл","Мартелл","Аррен", "Таргариен"]
    let additions = ["База", "Мать Драконов", "Пир Воронов", "Танец с Драконами"]
    
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
        addition = "База"
    }
    
}
