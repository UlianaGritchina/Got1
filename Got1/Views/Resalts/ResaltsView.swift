//
//  ResaltsView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

struct ResaltsView: View {
    @StateObject var viewModel: ResaltsViewViewModel
    init (resalt: Resalt) {
        _viewModel = StateObject(
            wrappedValue: ResaltsViewViewModel(resalt: resalt)
        )
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                Back(title: viewModel.resalt.addition)
                ScrollView {
                    ForEach(viewModel.resalt.players, id: \.self) { player in
                        HouseRow(player: player).padding()
                            .onTapGesture {
                                viewModel.king = player
                                viewModel.isShowKingAlert.toggle()
                            }
                    }
                }
                .opacity(viewModel.isShowKingAlert ? 0.3 : 1)
                .animation(.default, value: viewModel.isShowKingAlert)
                
                SaveKingAlert(king: viewModel.king,
                              additon: viewModel.resalt.addition,
                              saveAction: {
                    viewModel.saveKing()
                    delegate.updateKings()
                    
                },
                              showKing: $viewModel.isShowKingAlert)
            }
            .navigationTitle(viewModel.resalt.addition)
        }
    }
    
}

struct ResaltsView_Previews: PreviewProvider {
    static var previews: some View {
        ResaltsView(resalt: Resalt(players: [Player(name: "", house: "")], addition: "") )
            .preferredColorScheme(.dark)
    }
}

struct Back: View {
    let title: String
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        Circle()
            .frame(width: height / 2, height: height / 2)
            .foregroundColor(Color(title))
            .blur(radius: width / 2)
    }
}

struct HouseRow: View {
    let player: Player
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        ZStack {
            HStack {
                Image(player.house)
                    .resizable()
                    .frame(width: width / 5 , height: height / 10)
                    .cornerRadius(15)
                
                VStack(alignment: .leading) {
                    Text(player.name)
                        .bold()
                        .font(.system(size: height / 30))
                    Text(player.house)
                        .font(.system(size: height / 30))
                }
                Spacer()
            }
            .frame(width: width - 80, height: height / 10)
            
            RoundedRectangle(cornerRadius: 15)
                .stroke(Color("\(player.house)"))
                .frame(width: width - 80, height: height / 10)
                .shadow(color: .black, radius: 3, x: 0, y: 0)
            
            
        }
    }
}

struct SaveKingAlert: View {
    let king: Player
    let additon: String
    let saveAction: () -> Void
    @Binding var showKing: Bool
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM dd, YYY"
        return dateFormatter.string(from: Date())
    }
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        RoundedRectangle(cornerRadius: 20)
            .frame(width: width / 2, height: height / 4)
            .foregroundColor(.black)
            .overlay(
                VStack {
                    Text("Save king?").bold()
                        .padding()
                    VStack(alignment: .leading) {
                        Text(king.name).bold()
                        Text(king.house)
                        Text(additon)
                        Text(formattedDate)
                        HStack {
                            Button(action: {showKing.toggle()}) {
                                Text("Cancel")
                                    .foregroundColor(.red)
                                    .bold()
                                    .padding()
                            }
                            Button(action: {
                                saveAction()
                                showKing.toggle()
                                
                            }) {
                                Text("Save")
                                    .bold()
                                    .padding()
                            }
                        }
                    }
                }
            )
            .shadow(color: .black, radius: 10, x: 0, y: 0)
            .offset(x: 0, y:  -height / 4)
            .opacity(showKing ? 1 : 0)
            .animation(.default, value: showKing)
    }
}










struct HouseShape: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX + 50, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - 50, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.maxX - 50, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + 50, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.minX + 50, y:rect.minY))
            
        }
    }
}
