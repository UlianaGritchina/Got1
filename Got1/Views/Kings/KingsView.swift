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
    var body: some View {
        NavigationView {
            
            ZStack {
                BackView()
                
                
                VStack {
                    ScrollView {
                        ForEach(viewModel.kings, id: \.self) { king in
                            KingRowView(king: king).padding()
                        }
                    }
                }
                .opacity(viewModel.isShowNewKingCard ? 0.3 : 1)
                .animation(.default, value: viewModel.isShowNewKingCard)
                
                VStack {
                    NewKingCard.padding()
                    Spacer()
                }
                
                
            }
            .navigationTitle("Kings")
            .toolbar { Button(action: {viewModel.isShowNewKingCard.toggle()}) {
                ZStack {
                    Circle()
                        .frame(width: width / 9, height: width / 9)
                        .opacity(0.5)
                    Image(systemName: "plus.diamond.fill")
                        .foregroundColor(.white)
                }
            }
            }
        }
        
    }
}

struct KingsView_Previews: PreviewProvider {
    static var previews: some View {
        KingsView()
            .preferredColorScheme(.dark)
    }
}

extension KingsView {
    private var NewKingCard: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frame(width: width / 1.5, height: height / 5)
                .foregroundColor(.black)
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .frame(width: width / 1.5, height: height / 5)
            
        }
        .overlay(
            VStack(alignment: .leading) {
                Text("New King")
                    .bold()
                    .font(.system(size: height / 35))
                
                
                ZStack {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke()
                    
                    TextField("Name", text: $viewModel.king.name)
                        .padding(.leading)
                }.frame(width: width / 2.5, height: height / 20)
                
                
                HStack(spacing: 15) {
                    Menu(viewModel.king.house) {
                        ForEach(viewModel.houses, id: \.self) { house in
                            Button(action: {viewModel.king.house = house}) {
                                Text(house)
                            }
                        }
                    }
                    
                    Menu(viewModel.addition) {
                        ForEach(viewModel.additions, id: \.self) { addition in
                            Button(action: {viewModel.addition = addition}) {
                                Text(addition)
                            }
                        }
                    }
                }
                
                HStack {
                    Spacer()
                    Button(action: {viewModel.isShowNewKingCard.toggle()}) {
                        Text("Save")
                            .font(.system(size: height / 40))
                    }
                    
                }
            }
                .padding()
        )
        .offset(x: viewModel.isShowNewKingCard ? 0 : -height, y: 0)
        .rotationEffect(Angle(degrees: viewModel.isShowNewKingCard ? 0 : 270))
        .animation(.spring(), value: viewModel.isShowNewKingCard)
    }
}


struct KingRowView: View {
    let king: King
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width - 40, height: height / 7)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
            .opacity(0.2)
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .frame(width: width - 40, height: height / 7)
        }
        .overlay(
            HStack {
                VStack(alignment: .leading) {
                    Text("\(king.name ?? "") \(king.house ?? "")")
                        .bold()
                        .font(.system(size: height / 35))
                    Text(king.addition ?? "")
                        .bold()
                        .font(.system(size: height / 40))
                    Text("\(king.date ?? Date())")
                        .bold()
                        .font(.system(size: height / 45))
                        .foregroundColor(.gray)
                    
                    
                }
                Spacer()
                VStack {
                    Spacer()
                    Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/) {
                       Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                            .opacity(0.7)
                    }
                    
                }
            }.padding()
        )
    }
}



