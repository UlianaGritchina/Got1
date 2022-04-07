//
//  SupportView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 07.04.2022.
//

import SwiftUI

struct SupportView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Color(.black).ignoresSafeArea()
                
                VStack {
                    
                }
            }
            .navigationTitle("Support")
            .preferredColorScheme(.dark)
        }
    }
}

struct SupportView_Previews: PreviewProvider {
    static var previews: some View {
        SupportView()
    }
}
