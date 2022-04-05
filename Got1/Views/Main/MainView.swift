//
//  MainView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var viewModel = MainViewViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                BackView()
                
                ScrollView {
                    TFRectangleView(players: $viewModel.players).padding()
                    PickerView(selection: $viewModel.addition)
                        .padding()
                    ButtonView(title: "Start", action: {
                        viewModel.getResalts()
                        viewModel.togleShowResaltsView()
                    })
                        .padding()
                }
                
                CustomAlertView(addition: viewModel.addition,
                                show: $viewModel.showAlert)
                
            }
            .navigationTitle("Players")
            .preferredColorScheme(.dark)
            .toolbar {
                ToolbarItemGroup(placement: .keyboard) {
                    Spacer()
                    Button("Done") {UIApplication.shared.endEditing()}
                }
            }
            .sheet(isPresented: $viewModel.showResaltsView) {
                ResaltsView(resalt: viewModel.resalt)
            }
        }
        
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .preferredColorScheme(.dark)
    }
}

struct PickerView: View {
    @Binding var selection: Additions
    var body: some View {
        Picker("Addition", selection: $selection) {
            Text("Base")
                .tag(Additions.base)
            Text("Mother of Dragons")
                .tag(Additions.motherOfDragons)
            Text("Feast of Ravens")
                .tag(Additions.feastOfRavens)
            Text("Dance with Dragons")
                .tag(Additions.danceWithDragons)
        }
        .pickerStyle(WheelPickerStyle())
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}
