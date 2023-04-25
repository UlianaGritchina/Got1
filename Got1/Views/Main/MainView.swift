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
                ScrollView {
                    VStack {
                        playersTextFields
                        
                        additionPicker
                        
                        startButton
                    }
                    .navigationTitle("Игроки")
                    
                    .toolbar {
                        doneToolbarButon
                        supportToolbarButton
                    }
                    
                    .alert("Wrong players count", isPresented: $vm.isShowingAlert) {
                        Button("OK", role: .cancel) { }
                    }
                    .sheet(isPresented: $vm.isShowingResaltsView) {
                        ResaltsView(resalt: vm.resalt)
                    }
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}


extension MainView {
    
    private var playersTextFields: some View {
        ZStack {
            TFRectangleView(players: $vm.players)
                .padding()
                .opacity(vm.isShowingSupportView ? 0.3 : 1)
                .animation(.default, value: vm.isShowingSupportView)
            
            SupportCardView(isShow: vm.isShowingSupportView)
        }
    }
    
    private var startButton: some View {
        Button(action: vm.start) {
            GlassRectangleView(width: UIScreen.main.bounds.width / 1.5, height: 50)
                .opacity(0.8)
                .overlay {
                    Text("Начать")
                        .foregroundColor(.white)
                        .font(.system(size: 23, weight: .medium, design: .rounded))
                }
        }
        .padding(.vertical)
    }
    
    private var additionPicker: some View {
        HStack {
            Spacer()
            GlassRectangleView(width: UIScreen.main.bounds.width / 2, height: 40)
                .overlay {
                    Picker("Please choose a color", selection: $vm.addition) {
                        ForEach(vm.additions, id: \.self) {
                            Text($0.rawValue)
                        }
                    }
                }
        }
        .padding()
    }
    
    private var doneToolbarButon: some ToolbarContent {
        ToolbarItemGroup(placement: .keyboard) {
            Spacer()
            Button("Готово") { UIApplication.shared.endEditing() }
        }
    }
    
    private var supportToolbarButton: some ToolbarContent {
        ToolbarItemGroup(placement: .navigationBarTrailing) {
            SupportButtonView(isShowingSupportView: $vm.isShowingSupportView)
        }
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}
