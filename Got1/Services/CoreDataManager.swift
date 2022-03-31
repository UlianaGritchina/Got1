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
    
    init() {
        container = NSPersistentContainer(name: "Got1")
        container.loadPersistentStores { description, error in
            if let error = error {
                print(error)
            }
        }
        fetchKings()
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
    
    func addKing(player: Player, addition: String) {
        let king = King(context: container.viewContext)
        king.name = player.name
        king.house = player.house
        king.addition = addition
        king.date = Date()
        saveData()
    }
    
    func deleteKing(king: King) {
        container.viewContext.delete(king)
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
