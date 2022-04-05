//
//  ResaltsViewViewModel.swift
//  Got1
//
//  Created by Ульяна Гритчина on 30.03.2022.
//

import Foundation

class ResaltsViewViewModel: ObservableObject {
    
    let resalt: Resalt
    
    init(resalt: Resalt) {
        self.resalt = resalt
    }
    
}
