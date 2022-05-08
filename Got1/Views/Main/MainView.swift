//
//  MainView.swift
//  Got1
//
//  Created by Ульяна Гритчина on 26.03.2022.
//

import SwiftUI

struct MainView: View {
    @StateObject var vm = MainViewViewModel()
    var body: some View {
        NavigationView {
            ZStack {
                BackgoundView(isShowingSupportView: vm.isShowingSupportView)
                VStack {
                    ZStack {
                        TFRectangleView(players: $vm.players)
                            .padding()
                            .opacity(vm.isShowingSupportView ? 0.3 : 1)
                            .animation(.default, value: vm.isShowingSupportView)
                        
                        SupportCardView(isShow: vm.isShowingSupportView)
                    }
                    Spacer()
                }
                .navigationTitle("Игроки")
                
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        Button("Отмена") { UIApplication.shared.endEditing() }
                        .foregroundColor(.red)
                        
                        Spacer()
                        
                        AdditionsMenuView(vm: vm)
                        
                        Spacer()
                        
                        Button(action: { vm.start() }) {
                            Text("Начать")
                                .bold()
                                .foregroundColor(.green)
                        }
                    }
                }
                
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        SupportButtonView(isShowingSupportView: $vm.isShowingSupportView)
                    }
                }
                
                .alert("Wrong players count", isPresented: $vm.isShowingAlert) {
                    Button("OK", role: .cancel) { }
                }
                
                .sheet(isPresented: $vm.isShowingResaltsView) {
                    ResaltsView(resalt: vm.resalt)
                }
            }
        }.preferredColorScheme(.dark)
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



