//
//  GameDetails.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 26.04.2022.
//

import Foundation

struct GameDetails {
    let addition: Additions
    let players: [DetailPlayer]
    let finalRound: String
    let time: String
    let date: Date
}

struct DetailPlayer: Hashable {
    let name: String
    let house: String
    let castlesCount: String
}
