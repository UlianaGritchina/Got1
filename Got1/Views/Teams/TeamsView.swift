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
                BackView().opacity(0.6)
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
                Image(systemName: "plus.square.fill")
                    .symbolRenderingMode(.multicolor)    
            }
                
            .fullScreenCover(isPresented: $vm.isShowNewTeamView) {
                NewTeamView(vm: vm)
            }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}

