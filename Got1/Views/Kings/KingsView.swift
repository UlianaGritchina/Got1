//
//  KingsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 28.03.2022.
//

import SwiftUI

struct KingsView: View {
    @StateObject var vm = KingsViewViewModel()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var isShowNewDetail = false
    @State private var isShowPlayers = false
    @State private var isShowCards = false
    @State private var finalRound = "5"
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    BackgoundView(isShowingSupportView: false)
                    ScrollView {
                        ForEach(vm.kings, id: \.self) { king in
                            KingRowView(king: king,
                                        deleteAction: {
                                withAnimation{vm.deleteKing(king: king)}
                            })
                                .padding()
                        }
                    }
                    
                    VStack {
                        NewKingCard
                        Spacer()
                    }
                    
                    VStack {
                        ZStack {
                            NewGameDetailsView(
                                isShowDetail: $isShowNewDetail,
                                isShowNewKing: $vm.isShowNewKingCard
                            )
                        }
                        
                        Spacer()
                    }
                    .offset(x: isShowNewDetail ? 0 : width, y: 0)
                    .animation(.spring(), value: isShowNewDetail)
                    
                }
            }
            .navigationTitle("Короли: \(vm.kings.count)")
            
            .toolbar { addBuuton }
        }
        .preferredColorScheme(.dark)
    }
}


struct KingsView_Previews: PreviewProvider {
    static var previews: some View {
        KingsView()
    }
}

extension KingsView {
    private var addBuuton: some View {
        Button(action: {
            vm.isShowNewKingCard.toggle()
        }) {
            if vm.isShowNewKingCard || isShowNewDetail {
                Text("Отменить" )
                    .foregroundColor(.red)
            } else {
                Text("Добавить" )
                    .foregroundColor(.green)
            }
        }
    }
}

extension KingsView {
    private var NewKingCard: some View {
        Rectangle()
            .opacity(0)
            .background(.ultraThinMaterial)
            .frame(width: width - 20, height: height / 3)
            .cornerRadius(20)
            .overlay(
                ZStack {
                    LinearGradient(colors: [.white.opacity(0.5),.gray.opacity(0)],
                                   startPoint: .topLeading,
                                   endPoint: .bottomTrailing)
                    
                        .mask(RoundedRectangle(cornerRadius: 20).stroke())
                        .frame(width: width - 20, height: height / 3)
                        .overlay(
                            VStack(spacing: height / 50) {
                                HStack(alignment: .bottom) {
                                    Text("Новый Король:")
                                        .bold()
                                        .font(.system(size: height / 30))
                                    
                                    Spacer()
                                }
                                
                                VStack(alignment: .leading, spacing: 0) {
                                    TextField("Имя", text: $vm.king.name)
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: width / 2, height: 1)
                                        .foregroundColor(.gray)
                                    
                                }.font(.system(size: height / 35))
                                
                                
                                
                                HStack() {
                                    Text(vm.king.house)
                                        .font(.system(size: height / 40))
                                    
                                    Spacer()
                                    Menu("Выбрать") {
                                        ForEach(vm.houses, id: \.self) { house in
                                            Button(house, action: {vm.king.house = house})
                                        }
                                    }
                                }
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: width - 40, height: 1)
                                    .foregroundColor(.gray)
                                
                                HStack() {
                                    Text(vm.addition)
                                        .font(.system(size: height / 40))
                                    
                                    Spacer()
                                    
                                    Menu("Выбрать") {
                                        ForEach(vm.additions, id: \.self) { additon in
                                            Button(additon, action: {vm.addition = additon})
                                        }
                                    }
                                }
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: width - 40, height: 1)
                                    .foregroundColor(.gray)
                                
                                HStack {
                                    Button(action: {
                                        if vm.king.name != "" {
                                            vm.addKing()
                                            vm.isShowNewKingCard = false
                                            vm.clearData()
                                            UIApplication.shared.endEditing()
                                        } else {
                                            vm.isShowNewKingCard = false
                                            vm.clearData()
                                            UIApplication.shared.endEditing()
                                        }
                                    }) {
                                        
                                        Text("Сохранить")
                                            .bold()
                                            .font(.system(size: height / 40))
                                    }
                                    .frame(width: width / 2, height: height / 25)
                                    Button(action: {
                                        isShowNewDetail = true
                                        vm.isShowNewKingCard = false
                                    }) {
                                        Text("Добавить детеали")
                                        
                                            .font(.system(size: height / 50))
                                    }
                                    .frame(width: width / 2, height: height / 25)
                                }
                            }.padding()
                        )
                    
                }
            )
            .offset(x: vm.isShowNewKingCard ? 0 : -width , y: 0)
            .rotation3DEffect(.degrees(vm.isShowNewKingCard ? 0 : -20), axis: (x: 0.0, y: -0.5, z: 0.0))
            .animation(.spring(), value: vm.isShowNewKingCard)
        
    }
}






