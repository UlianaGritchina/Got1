//
//  KingsViewViewModel.swift
//  Got1
//
//  Created by Ульяна Гритчина on 29.03.2022.
//

import Foundation

class KingsViewViewModel: ObservableObject {
    
    @Published var kings: [King] = CoreDataManager.shered.savedKings
    
    func addKing(player: Player) {
        CoreDataManager.shered.addKing(player: player)
        updateKings()
    }

    func updateKings() {
        CoreDataManager.shered.fetchKings()
        kings = CoreDataManager.shered.savedKings
    }
    
}
