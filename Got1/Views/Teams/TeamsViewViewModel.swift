//
//  TeamViewViewModel.swift
//  Gotq
//
//  Created by Ульяна Гритчина on 01.04.2022.
//

import Foundation

class TeamsViewViewModel: ObservableObject {
    
    @Published var teams: [Team] = CoreDataManager.shered.savedTeams
    @Published var teamName = ""
    @Published var players = ["","","","","","","",""]
    @Published var addition: Additions = .base
    @Published var isShowNewTeamView = false
    @Published var isShowResultsView = false
    @Published var isShowAlertView = false
    
    func showNewTeamView() {
        isShowNewTeamView.toggle()
    }
    
    func saveTeam() {
        CoreDataManager.shered.addTeam(teamName: teamName, players: players, additeion: addition.rawValue)
        updateTeams()
        isShowAlertView = false
        isShowNewTeamView = false
        clearData()
    }
    
    func deleteTeam(team: Team) {
        CoreDataManager.shered.deleteTeam(team: team)
        updateTeams()
    }
    
    func updateTeams() {
        CoreDataManager.shered.fetchTeams()
        teams = CoreDataManager.shered.savedTeams
    }
    
    func clearData() {
        teamName = ""
        addition = .base
        players = ["","","","","","","",""]
    }
    
}
