//
//  Got1App.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

@main
struct Got1App: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            
            TabView {
                MainView()
                    .tabItem {
                        Label("Main", systemImage: "house.fill")
                    }
                KingsView()
                    .tabItem {
                        Label("Kings", systemImage: "crown.fill")
                    }
                
                TeamsView()
                    .tabItem {
                        Label("Teams", systemImage: "person.3.fill")
                    }
            }

//            ContentView()
//                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
