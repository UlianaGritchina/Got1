//
//  KingsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 28.03.2022.
//

import SwiftUI

struct KingsView: View {
    @StateObject var viewModel = KingsViewViewModel()
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var isShowNewDetail = false
    @State private var isShowPlayers = false
    @State private var finalRound = "5"
    var body: some View {
        NavigationView {
            VStack {
                ZStack {
                    ScrollView {
                        ForEach(viewModel.kings, id: \.self) { king in
                            KingRowView(king: king,
                                        deleteAction: {
                                withAnimation {
                                    viewModel.deleteKing(king: king)
                                }
                            })
                                .padding()
                        }
                    }
                    .opacity(viewModel.isShowNewKingCard ? 0.3 : 1)
                    .opacity(isShowNewDetail ? 0.3 : 1)
                    .animation(.default, value: viewModel.isShowNewKingCard)
                    
                    VStack {
                        NewKingCard
                        Spacer()
                    }
                    
                    
                    VStack {
                        ZStack {
                            
                            NewGameDetailsView(isShowDetail: $isShowNewDetail, isShowNewKing: $viewModel.isShowNewKingCard)
                            
                        }
                        
                        Spacer()
                    }
                    .offset(x: isShowNewDetail ? 0 : width, y: 0)
                    .animation(.spring(), value: isShowNewDetail)
                    
                }
            }
            .navigationTitle("Короли: \(viewModel.kings.count)")
            
            .toolbar { Button(action: {viewModel.isShowNewKingCard.toggle()}) {
                Image(systemName: viewModel.isShowNewKingCard ? "person.fill.badge.minus" : "person.fill.badge.plus")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
            }
            }
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
                                    TextField("Имя", text: $viewModel.king.name)
                                    RoundedRectangle(cornerRadius: 5)
                                        .frame(width: width / 2, height: 1)
                                        .foregroundColor(.gray)
                                    
                                }.font(.system(size: height / 35))
                                
                                
                                
                                HStack() {
                                    Text(viewModel.king.house)
                                        .font(.system(size: height / 40))
                                    
                                    Spacer()
                                    Menu("Выбрать") {
                                        ForEach(viewModel.houses, id: \.self) { house in
                                            Button(house, action: {viewModel.king.house = house})
                                        }
                                    }
                                }
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: width - 40, height: 1)
                                    .foregroundColor(.gray)
                                
                                HStack() {
                                    Text(viewModel.addition)
                                        .font(.system(size: height / 40))
                                    
                                    Spacer()
                                    
                                    Menu("Выбрать") {
                                        ForEach(viewModel.additions, id: \.self) { additon in
                                            Button(additon, action: {viewModel.addition = additon})
                                        }
                                    }
                                }
                                
                                RoundedRectangle(cornerRadius: 5)
                                    .frame(width: width - 40, height: 1)
                                    .foregroundColor(.gray)
                                
                                
                                
                                
                                
                                HStack {
                                    Button(action: {
                                        if viewModel.king.name != "" {
                                            viewModel.addKing()
                                            viewModel.isShowNewKingCard = false
                                            viewModel.clearData()
                                            UIApplication.shared.endEditing()
                                        } else {
                                            viewModel.isShowNewKingCard = false
                                            viewModel.clearData()
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
                                        viewModel.isShowNewKingCard = false
                                        
                                        
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
            .offset(x: viewModel.isShowNewKingCard ? 0 : -width , y: 0)
            .rotation3DEffect(.degrees(viewModel.isShowNewKingCard ? 0 : -20), axis: (x: 0.0, y: -0.5, z: 0.0))
            .animation(.spring(), value: viewModel.isShowNewKingCard)
        
    }
}


struct KingRowView: View {
    @State private var showingOptions = false
    @State private var isShowingGameDetailView = false
    let king: King
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let deleteAction: () ->Void
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYY"
        return dateFormatter.string(from: king.date ?? Date())
    }
    var body: some View {
        ZStack {
            
            Rectangle()
                .frame(width: width - 40, height: height / 7)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .opacity(0.1)
            LinearGradient(colors: [Color(king.house ?? ""), Color(king.house ?? "").opacity(0.5)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask(RoundedRectangle(cornerRadius: 20)
                        .stroke()
                        .frame(width: width - 40, height: height / 7))
            
        }
        .sheet(isPresented: $isShowingGameDetailView, content: {
            GameDetailsView()
        })
        .actionSheet(isPresented: $showingOptions) {
            ActionSheet(
                title: Text("Select a color"),
                buttons: [
                    .default(Text("Game detail")) {
                        isShowingGameDetailView.toggle()
                    },
                    
                        .default(Text("\(king.name ?? "") info")) {
                            
                        },
                    
                        .destructive(Text("Delete")) {
                            deleteAction()
                        },
                    
                        .cancel()
                ]
            )
        }
        
        .overlay(
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(king.name ?? "")
                            .font(.system(size: height / 33))
                            .bold()
                        Text(king.house ?? "").font(.system(size: height / 35))
                    }
                    
                    
                    Spacer()
                    Text(king.addition ?? "")
                        .font(.system(size: height / 40))
                        .foregroundColor(.gray)
                    Text(formattedDate)
                        .font(.system(size: height / 45))
                        .foregroundColor(.gray)
                }
                Spacer()
                
                VStack {
                    Spacer()
                    HStack {
                        Spacer()
                        Button(action: {showingOptions.toggle()}) {
                            Rectangle()
                                .frame(width: width / 4, height: height / 35)
                                .opacity(0)
                                .background(.ultraThinMaterial)
                                .cornerRadius(10)
                                .overlay(Image(systemName: "ellipsis"))
                        }
                        
                    }
                    
                    
                }.frame(width: width / 18)
                    .offset(x: -width / 10)
                
                
            }.padding()
        )
    }
}



