//
//  KingRowView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 08.05.2022.
//

import SwiftUI

struct KingRowView: View {
    @State private var showingOptions = false
    @State private var isShowingGameDetailView = false
    let king: King
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    let deleteAction: () ->Void
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ru_RU")
        dateFormatter.dateFormat = "d MMMM YYY"
        return dateFormatter.string(from: king.date ?? Date())
    }
    var body: some View {
        ZStack {
            Rectangle()
                .frame(width: width - 40, height: height / 7)
                .background(.ultraThinMaterial)
                .cornerRadius(20)
                .opacity(0.1)
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color(king.house ?? ""), lineWidth: 0.5)
                .frame(width: width - 40, height: height / 7)
            
        }
        .sheet(isPresented: $isShowingGameDetailView, content: {
            GameDetailsView()
        })
        .actionSheet(isPresented: $showingOptions) {
            ActionSheet(
                title: Text(king.name ?? ""),
                buttons: [
                    .default(Text("Детели")) {
                        isShowingGameDetailView.toggle()
                    },
                    
                        .default(Text(king.name ?? "")) {
                            
                        },
                    
                        .destructive(Text("Удалить")) { deleteAction() },
                    
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
                                .opacity(0.1)
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

