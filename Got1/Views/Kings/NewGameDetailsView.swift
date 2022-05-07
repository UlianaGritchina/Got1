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
    var body: some View {
        ZStack {
            Rectangle()
                .opacity(0)
                .background(.ultraThinMaterial)
                .frame(width: width - 20, height: height / 3)
                .cornerRadius(20)
            
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
                            Text("Команда").font(.system(size: height / 40))
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
            
        }
        .rotation3DEffect(.degrees(isShowDetail ? 0 : 20), axis: (x: 0.0, y: -0.5, z: 0.0))
    }
}

struct NewGameDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        NewGameDetailsView(isShowDetail: .constant(false), isShowNewKing: .constant(true))
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
