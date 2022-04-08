//
//  TeamRowView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 30.03.2022.
//

import SwiftUI

struct TeamRowView: View {
    let team: Team
    @StateObject var teamViewModel: TeamsViewViewModel
    @StateObject var teamRowViewModel = TeamRowViewViewModel()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {

        GlassRectangleView(width: width - 40, height: height / 4)
            .overlay(VStack {
                Text(team.teamName ?? "")
                    .bold()
                    .font(.system(size: height / 30))
                    .foregroundColor(Color("Tirell"))
                
                Text(team.addition ?? "")
                    .font(.system(size: height / 40))
                
                Spacer()
                
                VStack(spacing: 10) {
                    Text("\(team.name1 ?? "") \(team.name2 ?? "") \(team.name3 ?? "") \(team.name4 ?? "")")
                    Text("\(team.name5 ?? "") \(team.name6 ?? "") \(team.name7 ?? "") \(team.name8 ?? "")")
                }
                .font(.system(size: height / 35))
                
                Spacer()
                
                HStack {
                    Button(action: {
                        withAnimation {
                            teamViewModel.deleteTeam(team: team)
                        }
                        
                    }) {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                            .opacity(0.7)
                    }
                    Spacer()
                    Button(action: {
                        teamRowViewModel.getRsult(players: [team.name1 ?? "", team.name2 ?? "", team.name3 ?? "", team.name4 ?? "", team.name5 ?? "", team.name6 ?? "" ,team.name7 ?? "", team.name8 ?? ""], addition: team.addition ?? "")
                        teamRowViewModel.isShowResultsView.toggle()
                        
                    }) {
                        Text("Play")
                            .bold()
                            .font(.system(size: height / 35))
                    }
                }
            }.padding()
            )
            .sheet(isPresented: $teamRowViewModel.isShowResultsView) {
                ResaltsView(resalt: teamRowViewModel.result)
            }
    }
}

struct TeamRowView_Previews: PreviewProvider {
    static var previews: some View {
        TeamRowView(team: Team(), teamViewModel: TeamsViewViewModel())
    }
}
