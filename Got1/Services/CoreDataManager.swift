//
//  CoreData.swift
//  Got1
//
//  Created by Ульяна Гритчина on 29.03.2022.
//

import SwiftUI
import CoreData

class CoreDataManager {
    let container: NSPersistentContainer
    
    static let shered = CoreDataManager()
    @Published var savedKings: [King] = []
    @Published var savedTeams: [Team] = []
    
    init() {
        container = NSPersistentContainer(name: "Got1")
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error)
            }
        }
        fetchKings()
        fetchTeams()
    }
    
    func fetchKings()  {
        let request = NSFetchRequest<King>(entityName: "King")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \King.date, ascending: false)]
        do {
            savedKings =  try container.viewContext.fetch(request)
        } catch let error {
            print(error)
        }
    }
    
    func fetchTeams()  {
        let request = NSFetchRequest<Team>(entityName: "Team")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \King.date, ascending: false)]
        do {
            savedTeams =  try container.viewContext.fetch(request)
        } catch let error {
            print(error)
        }
    }
    
    func addKing(player: Player, addition: String) {
        let king = King(context: container.viewContext)
        king.name = player.name
        king.house = player.house
        king.addition = addition
        king.date = Date()
        saveData()
    }
    
    func addTeam(teamName: String, players: [String], additeion: String) {
        let team = Team(context: container.viewContext)
        team.teamName = teamName
        team.addition = additeion
        team.name1 = players[0]
        team.name2 = players[1]
        team.name3 = players[2]
        team.name4 = players[3]
        team.name5 = players[4]
        team.name6 = players[5]
        team.name7 = players[6]
        team.name8 = players[7]
        team.date = Date()
        saveData()
    }
    
    func deleteKing(king: King) {
        container.viewContext.delete(king)
        saveData()
    }
    
    func deleteTeam(team: Team) {
        container.viewContext.delete(team)
        saveData()
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
            fetchKings()
        } catch {
            print(error.localizedDescription)
        }
    }
}
