//
//  TeamViewViewModel.swift
//  Gotq
//
//  Created by Ульяна Гритчина on 01.04.2022.
//

import Foundation

class TeamViewViewModel: ObservableObject {
    
    @Published var teams: [Team] = CoreDataManager.shered.savedTeams
    @Published var teamName = ""
    @Published var players = ["","","","","","","",""]
    @Published var addition = "Base"
    @Published var isShowNewTeamView = false
    @Published var isShowResultsView = false
    
    func showNewTeamView() {
        isShowNewTeamView.toggle()
    }
    
    func saveTeam() {
        CoreDataManager.shered.addTeam(teamName: teamName, players: players, additeion: addition)
        updateTeams()
    }
    
    func deleteTeam(team: Team) {
        CoreDataManager.shered.deleteTeam(team: team)
        updateTeams()
    }
    
    func updateTeams() {
        CoreDataManager.shered.fetchTeams()
        teams = CoreDataManager.shered.savedTeams
    }
    
}
