//
//  NewTeamView.swift
//  Gotq
//
//  Created by Ульяна Гритчина on 05.04.2022.
//

import SwiftUI

struct NewTeamView: View {
    @ObservedObject var vm: TeamViewViewModel
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var addition: Additions = .base
    var body: some View {
        
        NavigationView {
            ScrollView {
            ZStack {
                
                BackView().opacity(0.5)
                 
           
                VStack(alignment: .center) {
                    TextField("Team name", text: $vm.teamName)
                        .font(.system(size: height / 25))
                        .frame(width: width - 40, height: 60)
                        .multilineTextAlignment(.center)
                        .padding(.top, height / 7)
                    
                    HStack {
                      
                            VStack {
                                ForEach(1..<5, id: \.self) { index in
                                    TextField("Player \(index)", text: $vm.players[index - 1])
                                        .font(.system(size: height / 30))
                                        .frame(width: width / 2.2, height: 60)
                                        .multilineTextAlignment(.center)
                                }
                            }
                        
                        
                        VStack {
                            ForEach(5..<9, id: \.self) { index in
                                TextField("Player \(index)", text: $vm.players[index - 1])
                                    .font(.system(size: height / 30))
                                    .frame(width: width / 2.2, height: 60)
                                    .multilineTextAlignment(.center)
                            }
                            
                        }
                    }
                    
                
                    PickerView(selection: $addition)
                    
                    Spacer()
                    Button(action: {
                        vm.addition = addition.rawValue
                        vm.saveTeam()
                        vm.showNewTeamView()
                        
                    }) {
                        ZStack {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke()
                                .frame(width: width - 40, height: 60)
                            Text("Save")
                                .bold()
                                .font(.system(size: height / 40))
                        }
                    }.padding(.top, height / 25)
                        .padding()
                        .ignoresSafeArea()
                }
                } .ignoresSafeArea()
            }
            .ignoresSafeArea()
            .preferredColorScheme(.dark)
                .navigationTitle("New Team")
                .toolbar { Button(action: {vm.showNewTeamView()}) {
                    ZStack {
                        Text("Cancel")
                            .foregroundColor(.red)
                            .opacity(0.8)
                    }
                }
                }
            
            
        }
    }
}

struct NewTeamView_Previews: PreviewProvider {
    static var previews: some View {
        NewTeamView(vm: TeamViewViewModel())
    }
}
