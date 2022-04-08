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
                BackView().opacity(0.6)
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
                NewKingCard
            }
            .navigationTitle("Kings")
            .toolbar { Button(action: {viewModel.isShowNewKingCard.toggle()}) {
                Image(systemName: viewModel.isShowNewKingCard ? "person.fill.badge.minus" : "person.fill.badge.plus")
                    .symbolRenderingMode(.multicolor)
                    .foregroundColor(.white)
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
        RoundedRectangle(cornerRadius: 20)
            .fill(LinearGradient(colors: [Color("DarkBlue"),.black], startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: width - 20, height: height / 2.5)
            .overlay(
                LinearGradient(colors: [.green,.yellow,.purple,.blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                    .mask(RoundedRectangle(cornerRadius: 20)
                            .stroke())
                    .frame(width: width - 20, height: height / 2.5)
            )

            .overlay(VStack(spacing: 10) {
                Text("New King")
                    .bold()
                    .padding()
                    .font(.system(size: height / 30))
                
                
               TextField("Name", text: $viewModel.king.name)
                                .multilineTextAlignment(.center)
                                .font(.system(size: height / 35))
                
                
                Menu(viewModel.king.house) {
                    ForEach(viewModel.houses, id: \.self) { house in
                        Button(house, action: {viewModel.king.house = house})
                    }
                }
                .font(.system(size: height / 35))
                .padding()
                
                
                
                Menu(viewModel.addition) {
                    ForEach(viewModel.additions, id: \.self) { additon in
                        Button(additon, action: {viewModel.addition = additon})
                    }
                }
                .font(.system(size: height / 35))
                .padding()
                
                
                Button(action: {
                    viewModel.addKing()
                    viewModel.isShowNewKingCard = false
                    viewModel.clearData()
                    UIApplication.shared.endEditing()
                    
                }) {
                    RoundedRectangle(cornerRadius: 20)
                        .stroke()
                        .overlay(
                            Text("Save")
                                .bold()
                                .font(.system(size: height / 40))
                        )
                }
                .frame(width: width / 2, height: height / 20)
                
            }.padding()
            )
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: 10)
            .frame(width: width - 20, height: height / 2.5)
            .rotationEffect(Angle(degrees: viewModel.isShowNewKingCard ? 0 : 180))
            .offset(x: 0, y: viewModel.isShowNewKingCard ? 0 : -height)
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
                .opacity(0.1)
            LinearGradient(colors: [Color(king.house ?? ""), Color(king.house ?? "").opacity(0.5)],
                           startPoint: .topLeading, endPoint: .bottomTrailing)
                .mask(RoundedRectangle(cornerRadius: 20)
                        .stroke()
                        .frame(width: width - 40, height: height / 7))
            
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



