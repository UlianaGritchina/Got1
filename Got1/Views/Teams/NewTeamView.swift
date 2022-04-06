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
                        PickerView(selection: $addition)
                        
                            
                        Button(action: {
                            vm.showNewTeamView()
                            vm.addition = addition.rawValue
                            vm.saveTeam()
                            vm.clearData()
                        }) {
                            ZStack {
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke()
                                    .frame(width: width / 2, height: 60)
                                Text("Save")
                                    .bold()
                                    .font(.system(size: height / 40))
                            }
                        }
                        .padding(.top, height / 8)
                        Text("d")  .padding(.top, height / 8)
                    }
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
