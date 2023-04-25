//
//  NewTeamView.swift
//  Gotq
//
//  Created by Ульяна Гритчина on 05.04.2022.
//

import SwiftUI

struct NewTeamView: View {
    @ObservedObject var vm: TeamsViewViewModel
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var gotManager = GotGeneratorManager(playersNames: [],
                                                      addition: .base)
    @State private var isShowAlert = false
    @State private var addition: Additions = .base
    var body: some View {
        NavigationView {
            
            ScrollView {
                ZStack {
                    Color(.black)
                    
                    BackView().opacity(0.6)
                    
                    VStack(alignment: .center) {
                        
                        TextField("Team name", text: $vm.teamName)
                            .font(.system(size: height / 25))
                            .frame(width: width - 40, height: 60)
                            .multilineTextAlignment(.center)
                            .padding(.top, height / 6)
                        
                            TFeldsView(players: $vm.players)
                        
                        VStack(spacing: UIScreen.main.bounds.height / 6) {
                            
                            Button(action: {
                                vm.addition = addition

                                gotManager = GotGeneratorManager(playersNames: vm.players,
                                                               addition: vm.addition)
                                gotManager.getResult()
                                                               
                                if !gotManager.result.players.isEmpty {
                                    isShowAlert = false
                                    vm.saveTeam()
                                    vm.isShowNewTeamView = false
                                } else {
                                    isShowAlert = true
                                }
                            }) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 20)
                                        .stroke()
                                        .frame(width: width / 1.5, height: height / 16)
                                    Text("Save")
                                        .bold()
                                        .font(.system(size: height / 40))
                                }
                            }
                            
                        }.padding(.top, height / 25)
                        
                        
                    }
                    
                }
            }.ignoresSafeArea()
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {UIApplication.shared.endEditing()}
                    }
                }
                .navigationTitle("New Team")
            
                .alert("Wrong players count", isPresented: $isShowAlert) {
                    Button("OK", role: .cancel) { }
                }
            
                .toolbar { Button(action: {vm.showNewTeamView()}) {
                    Image(systemName: "minus.square.fill")
                        .foregroundColor(.red)
                }
                }
        }
    }
}

struct NewTeamView_Previews: PreviewProvider {
    static var previews: some View {
        NewTeamView(vm: TeamsViewViewModel())
    }
}
