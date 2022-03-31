//
//  ResaltsViewViewModel.swift
//  Got1
//
//  Created by Ульяна Гритчина on 30.03.2022.
//

import Foundation

class ResaltsViewViewModel: ObservableObject {
    
    let resalt: Resalt
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYY"
        return dateFormatter.string(from: Date())
    }
   
    @Published var king: Player = Player(name: "", house: "")
    @Published var isShowKingAlert = false
    
    init(resalt: Resalt) {
        self.resalt = resalt
    }
    
    func saveKing() {
        CoreDataManager.shered.addKing(player: king)
    }
    
}
