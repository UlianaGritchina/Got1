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
    @State private var gotManager = GotResultsManager(playersNames: [],
                                                      addition: "")
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
                            .padding(.top, height / 7)
                        
                        TFeldsView(players: $vm.players)
                        AddiotionPickerView(selected: $vm.addition)
                        
                        
                        Button(action: {
                            vm.addition = addition

                            gotManager = GotResultsManager(playersNames: vm.players,
                                                           addition: vm.addition.rawValue)
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
                        .padding(.top, -20)
                        Text("d").padding(.top, height / 7)
                    }
                    
                    VStack {
                        Rectangle()
                            .frame(width: width - 80, height: height / 5)
                            .opacity(0)
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                            .overlay(
                                
                                
                                VStack {
                                    Text("Wrong team")
                                        .bold()
                                        .font(.system(size: height / 30))
                                    Text("The team does not comply with the rules of the game \(vm.addition.rawValue)")
                                    Spacer()
                                    Button(action: {isShowAlert.toggle()}) {
                                        Text("OK")
                                            .bold()
                                            .font(.system(size: height / 40))
                                    }
                                }.padding()
                            )
                            .opacity(isShowAlert ? 1 : 0)
                            .animation(.spring(), value: isShowAlert)
                        Spacer()
                    }.padding(.top, height / 7)
                    
                }
                
                
            }.ignoresSafeArea()
                .preferredColorScheme(.dark)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Spacer()
                        Button("Done") {UIApplication.shared.endEditing()}
                    }
                }
                .navigationTitle("New Team")
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
