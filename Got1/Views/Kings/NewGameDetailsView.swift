//
//  NewGameDetailsView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 04.05.2022.
//

import SwiftUI

struct NewGameDetailsView: View {
    @Binding var isShowDetail: Bool
    @Binding var isShowNewKing: Bool
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var finalRound = "0"
    @State private var hourse = ""
    @State private var min = ""
    @State private var players: [String] = ["","","","","","","",""]
    @State private var isShowingPlayers = true
    var body: some View {
        ZStack {
            Rect()
            RoundedRectangle(cornerRadius: 20)
                .stroke(.gray)
                .frame(width: width - 20, height: height / 3)
                .overlay(
                    
                    VStack(spacing: height / 45) {
                        HStack {
                            Text("Детели игры:")
                                .bold()
                                .font(.system(size: height / 30))
                            Spacer()
                        }
                        HStack {
                            Text("Финальный раунд - ")
                                .font(.system(size: height / 40))
                            
                            Text(finalRound)
                                .bold()
                                .font(.system(size: height / 40))
                            
                            Spacer()
                            
                            Menu("Выбрать") {
                                ForEach(1..<11, id: \.self) { round in
                                    Button(action: {finalRound = String(round)}) {
                                        Text("\(round)")
                                    }
                                }
                            }
                        }
                        
                        Line()
                        
                        HStack {
                            Text("Время игры - ")
                                .font(.system(size: height / 40))
                            
                            HStack {
                                TextField("Часы", text: $hourse)
                                Text(":")
                                TextField("Минуты", text: $min)
                            }
                            .frame(width: width / 2.5, height: 20)
                            .multilineTextAlignment(.center)
                            .keyboardType(.numberPad)
                            
                            Spacer()
                        }
                        
                        Line()
                        
                        HStack {
                            Button(action: {
                                isShowingPlayers.toggle()
                            }) {
                                Text("Кто играл").font(.system(size: height / 40))
                            }
                            
                            Spacer()
                        }
                        
                        HStack {
                            Button(action: {}) {
                                Text("Сохранить")
                                    .bold()
                                    .foregroundColor(.green)
                            }
                            Spacer()
                            Button(action: {
                                isShowDetail = false
                                isShowNewKing = true
                            }) {
                                Text("Отменить")
                                    .foregroundColor(.red)
                            }
                        }
                        
                        Spacer()
                        
                    }.padding())
            
            Rect()
                .overlay(
                    ScrollView {
                        VStack(alignment: .leading) {
                            HStack {
                                Button("Отменить", action: {isShowingPlayers.toggle()})
                                    .foregroundColor(.red)
                                Spacer()
                                Button("Сохранить", action: {isShowingPlayers.toggle()})
                                    .foregroundColor(.green)
                            }
                            
                            ForEach(1..<9) { index in
                                PlayerView(index: index)
                                Line()
                            }
                            
                        }
                    }
                        .padding()
                )
                .offset(x: 0, y: isShowingPlayers ? 0 : -height)
                .animation(.spring(), value: isShowingPlayers)
            
        }
    }
}


struct NewGameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameDetailsView(isShowDetail: .constant(true), isShowNewKing: .constant(true))
            .preferredColorScheme(.dark)
    }
}

struct Line: View {
    let width = UIScreen.main.bounds.width
    var body: some View {
        RoundedRectangle(cornerRadius: 5)
            .frame(width: width - 40, height: 1)
            .foregroundColor(.gray)
    }
}


struct PlayerView: View {
    let index: Int
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        VStack(alignment: .leading) {
            Text("Игрок \(index)")
                .font(.system(size: height / 35))
                .bold()
            HStack(spacing: width / 15) {
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .frame(width: width / 2.5, height: height / 25)
                        .opacity(0.3)
                    TextField("Имя", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                        .frame(width: width / 2.5)
                        .font(.system(size: height / 35))
                }
                HStack {
                    Menu("Замки") {
                        ForEach(1..<8) { index in
                            Button(action: {}) {
                                Text("\(index)")
                            }
                        }
                    }
                    
                    Text("5")
                        .font(.system(size: height / 40))
                        .bold()
                }
                Menu("Дом") {
                    /*@START_MENU_TOKEN@*/Text("Menu Item 1")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Menu Item 2")/*@END_MENU_TOKEN@*/
                    /*@START_MENU_TOKEN@*/Text("Menu Item 3")/*@END_MENU_TOKEN@*/
                }
                
            }
            .multilineTextAlignment(.center)
        }
    }
}

struct Rect: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        Rectangle()
            .opacity(0)
            .background(.ultraThinMaterial)
            .frame(width: width - 20, height: height / 3)
            .cornerRadius(20)
    }
}
