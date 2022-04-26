//
//  SettingsView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 22.04.2022.
//

import SwiftUI

enum Language {
    case engl
    case rus
}

struct SettingsView: View {
    let width = UIScreen.main.bounds.width
    let height = UIScreen.main.bounds.height
    @State private var language: Language = .engl
    var body: some View {
        NavigationView {
            ZStack {
                Color.gray.ignoresSafeArea()
                    .opacity(0.2)
                VStack {
                    HStack {
                       
                        
                        Text("Language")
                            .font(.system(size: height / 35))
                        
                        Spacer()
                    }
                    
                    Button(action: {language = .engl}) {
                        Text("English")
                            .font(.system(size: language == .engl ? height / 35 : height / 45))
                            .foregroundColor(.white)
                            .opacity(language == .engl ? 1 : 0.5)
                    }
                    .padding()
                   
                    
                    
                    Button(action: {language = .rus}) {
                        Text("Русский")
                            .font(.system(size: language == .rus ? height / 35 : height / 45))
                            .foregroundColor(.white)
                            .opacity(language == .rus ? 1 : 0.5)
                    }
                    
                    
                    Spacer()
                    
                   
                    
                }
                .padding()
            }
            .navigationTitle("Settings")
            
            
        }.preferredColorScheme(.dark)
    }
}

struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
