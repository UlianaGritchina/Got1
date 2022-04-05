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
                            KingRowView(king: king,
                                        deleteAction: {
                                withAnimation {
                                    viewModel.deleteKing(king: king)
                                }
                                
                                
                            })
                                .padding()
                        }
                    }
                }
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
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Save") {
                        viewModel.addKing()
                        viewModel.king.house = "house"
                        viewModel.king.name = ""
                        viewModel.addition = "addition"
                        viewModel.isShowNewKingCard.toggle()
                        UIApplication.shared.endEditing()
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
                .frame(width: width - 40, height: height / 5)
                .foregroundColor(.black)
                .shadow(color: .white.opacity(0.5), radius: 5, x: 0, y: 0)
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .frame(width: width - 40, height: height / 5)
            
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
                
                
                HStack(spacing: 20) {
                    Menu(viewModel.king.house) {
                        ForEach(viewModel.houses, id: \.self) { house in
                            Button(action: {viewModel.king.house = house}) {
                                Text(house)
                            }
                        }
                    }
                    .padding(.horizontal)
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
                    Button(action: {
                        viewModel.addKing()
                        viewModel.king.house = "house"
                        viewModel.king.name = ""
                        viewModel.addition = "addition"
                        viewModel.isShowNewKingCard.toggle()
                        UIApplication.shared.endEditing()
                        
                    }) {
                        Text("Save")
                            .font(.system(size: height / 40))
                    }
                    
                }
            }
                .padding()
        )
        .offset(x: 0, y: viewModel.isShowNewKingCard ? 0 : height)
        //.rotationEffect(Angle(degrees: viewModel.isShowNewKingCard ? 0 : 270))
        .animation(.spring(), value: viewModel.isShowNewKingCard)
    }
}


struct KingRowView: View {
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
            .opacity(0.2)
            RoundedRectangle(cornerRadius: 20)
                .stroke()
                .frame(width: width - 40, height: height / 7)
        }
        .overlay(
            HStack {
                VStack(alignment: .leading) {
                    HStack {
                        Text(king.name ?? "")
                            .bold()
                        Text(king.house ?? "")
                    }
                    .font(.system(size: height / 35))
                    
                    Text(king.addition ?? "")
                        .font(.system(size: height / 40))
                    Text(formattedDate)
                        .font(.system(size: height / 45))
                        .foregroundColor(.gray)
                    
                    
                }
                Spacer()
                VStack {
                    Spacer()
                    Button(action: {deleteAction()}) {
                       Image(systemName: "trash.fill")
                            .foregroundColor(.red)
                            .opacity(0.7)
                    }
                    
                }
            }.padding()
        )
    }
}



