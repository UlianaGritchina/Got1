//
//  TeamsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 30.03.2022.
//

import SwiftUI

struct TeamsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var isShowAlert = false
    var body: some View {
        NavigationView {
            ZStack {
                BackView()
                
                VStack {
                    ScrollView {
                        ForEach(0..<5) { _ in
                            TeamRowView().padding()
                        }
                    }
                }//.opacity(isShowAlert ? 0.2 : 1)
                
                VStack {
                    ZStack {
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: width - 20, height: height / 2)
                            .foregroundColor(.blue)
                            .opacity(0.35)
                        RoundedRectangle(cornerRadius: 20)
                            .frame(width: width - 20, height: height / 2)
                            .background(.ultraThinMaterial)
                            .cornerRadius(20)
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(lineWidth: 2)
                            .frame(width: width - 20, height: height / 2)
                            .shadow(color: .black, radius: 8, x: 0, y: 0)
                    }
                    .overlay(
                    
                        VStack{
                            Text("New Team")
                                .font(.system(size: height / 25))
                                .bold()
                            TextField("Team name", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                .multilineTextAlignment(.center)
                                .font(.system(size: height / 25))
                            HStack {
                                VStack {
                                    ForEach(0..<4) { index  in
                                        TextField("Player \(index + 1)", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                            .multilineTextAlignment(.center)
                                            .font(.system(size: height / 35))
                                    }
                                }
                                VStack {
                                    ForEach(4..<8) { index in
                                        TextField("Player \(index + 1)", text: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Value@*/.constant("")/*@END_MENU_TOKEN@*/)
                                            .multilineTextAlignment(.center)
                                            .font(.system(size: height / 35))
                                    }
                                }
                            }
                            Spacer()
                            
                            ZStack {
                                RoundedRectangle(cornerRadius: 10)
                                    .frame(width: width / 2, height: height / 25)
                                Menu("Addition") {
                                    Text("Base")
                                    Text("Mother of Drahons")
                                    Text("Feast of Ravens")
                                    Text("Dance with Dragons")
                                }
                            }

                            Spacer()
                            Button(action: {}) {
                                ZStack {
                                    RoundedRectangle(cornerRadius: 10)
                                        .frame(width: width / 2, height: height / 25)
                                    Text("Save").bold()
                                        .foregroundColor(.white)
                                }
                            }
                            
                        }
                            .padding()
                        
                    )
                    .offset(x: 0, y: isShowAlert ? 0 : height)
                    .animation(.spring(), value: isShowAlert)
                    
                    
                    
                    Spacer()
                }
                
            }
            .navigationTitle("Teams")
            .toolbar { Button(action: {isShowAlert.toggle()}) {
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
        .preferredColorScheme(.dark)
    }
}

struct TeamsView_Previews: PreviewProvider {
    static var previews: some View {
        TeamsView()
    }
}
