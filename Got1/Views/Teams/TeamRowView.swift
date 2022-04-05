//
//  TeamRowView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 30.03.2022.
//

import SwiftUI

struct TeamRowView: View {
    let team: Team
    @StateObject var vm: TeamViewViewModel
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width - 40, height: height / 4)
                .foregroundColor(.black)
                .opacity(0.4)
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width - 40, height: height / 4)
                .background(.ultraThinMaterial)
                .opacity(0.2)
                .cornerRadius(20)
            LinearGradient(colors: [.white,.gray], startPoint: .top, endPoint: .bottom)
                .mask(RoundedRectangle(cornerRadius: 20)
                        .stroke())
                .frame(width: width - 40, height: height / 4)
        }
        .overlay(
            
            VStack {
                
                Text(team.teamName ?? "")
                    .bold()
                    .font(.system(size: height / 30))
                    .foregroundColor(.green.opacity(0.7))
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
                            vm.deleteTeam(team: team)
                        }
                        
                    }) {
                        Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                            .opacity(0.7)
                    }
                    Spacer()
                    Button(action: {
                        let players = [team.name1, team.name2,team.name3,  team.name4, team.name5, team.name6, team.name7,team.name8]
                        let addition = vm.addition
                        
                        var houses = ["Barateon","Stark","Lannister","Greyjoy","Tirell","Martell"]
                        
                        
                        
                        
                        vm.isShowResultsView.toggle()
                        
                    }) {
                        Text("Play")
                            .bold()
                            .font(.system(size: height / 35))
                        
                    }
                }
            }.padding()
        )
    }
}

struct TeamRowView_Previews: PreviewProvider {
    static var previews: some View {
        TeamRowView(team: Team(), vm: TeamViewViewModel())
    }
}
