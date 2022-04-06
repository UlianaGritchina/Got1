//
//  TeamsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 30.03.2022.
//

import SwiftUI

struct TeamsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @StateObject var vm = TeamsViewViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                BackView()
                VStack {
                    ScrollView {
                        ForEach(vm.teams, id: \.self) { team in
                           TeamRowView(team: team, teamViewModel: vm)
                                .padding()
                        }
                    }
                }
            }
            .navigationTitle("Teams")
            .toolbar { Button(action: {vm.showNewTeamView()}) {
                ZStack {
                    Circle()
                        .frame(width: width / 9, height: width / 9)
                        .opacity(0.5)
                    Image(systemName: "plus.diamond.fill")
                        .foregroundColor(.white)
                }
            }
                
            .sheet(isPresented: $vm.isShowNewTeamView) {
                NewTeamView(vm: vm)
            }
            }
        }
        
        .preferredColorScheme(.dark)
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
            .preferredColorScheme(.dark)
    }
}

