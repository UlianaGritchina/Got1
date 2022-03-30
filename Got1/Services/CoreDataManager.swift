//
//  CoreData.swift
//  Got1
//
//  Created by Ульяна Гритчина on 29.03.2022.
//

import Foundation
import CoreData

class CoreDataManager {
    let container: NSPersistentContainer
    
    static let shered = CoreDataManager()
    
    init() {
        container = NSPersistentContainer(name: "King")
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error)
            }
        }
    }
    
    func fetchKings() -> [King] {
        let request = NSFetchRequest<King>(entityName: "King")
        request.sortDescriptors = [NSSortDescriptor(keyPath: \King.date, ascending: false)]
        do {
            return try container.viewContext.fetch(request)
        } catch let error {
            print(error)
            return []
        }
    }
    
    func addKing(player: Player) {
        let king = King(context: container.viewContext)
        king.name = player.name
        king.house = player.house
        saveData()
    }
    
    func deleteKing(king: King) {
        container.viewContext.delete(king)
        saveData()
    }
    
    private func saveData() {
        do {
            try container.viewContext.save()
        } catch {
            print(error)
        }
    }
    
}
