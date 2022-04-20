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
            ScrollView {
                ZStack {
                    BackView().opacity(0.6)
                    VStack {
                        TFRectangleView(players: $viewModel.players)
                            .padding(.top, UIScreen.main.bounds.height / 6 + 15)
                        
                        VStack(spacing: UIScreen.main.bounds.height / 9) {
                            
                            AddiotionPickerView(selected: $viewModel.addition).padding()
                            
                            ButtonView(title: "Start", action: {
                                viewModel.getResult()
                                viewModel.togleShowResaltsView()
                            })
                            
                        }
                    }
                    CustomAlertView(addition: viewModel.addition,
                                    show: $viewModel.showAlert)
                }
            }
            .ignoresSafeArea()
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

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}



