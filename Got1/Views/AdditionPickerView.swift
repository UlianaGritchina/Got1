//
//  AdditionPickerView.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 20.04.2022.
//

import SwiftUI

struct AddiotionPickerView: View {
    @Binding var selected: Additions
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        VStack(spacing: width / 35) {
            
            AdditionRectangle(addition: .base, selectet: $selected)
            
            HStack {
                AdditionRectangle(addition: .feastOfRavens, selectet: $selected)
                AdditionRectangle(addition: .motherOfDragons, selectet: $selected)
            }
            
            AdditionRectangle(addition: .danceWithDragons, selectet: $selected)
            
        }
    }
}

struct AdditionPickerView_Previews: PreviewProvider {
    static var previews: some View {
        AddiotionPickerView(selected: .constant(.base))
    }
}


struct AdditionRectangle: View {
    let addition: Additions
    @Binding var selectet: Additions
    private let width = UIScreen.main.bounds.width
    private let height = UIScreen.main.bounds.height
    var body: some View {
        Button(action: {selectet = addition}) {
            RoundedRectangle(cornerRadius: 10)
                .frame(width: addition == .danceWithDragons ? width / 2 : width / 2.3, height: height / 20)
                .opacity(selectet == addition ? 0.3 : 0.3)
                .foregroundColor(.white)
                .overlay(
                    ZStack {
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(.white)
                        
                        Text(addition.rawValue).bold()
                            .font(.system(size: height / 45))
                            .foregroundColor(.white)
                    })
                .opacity(selectet == addition ? 1 : 0.5)
        }
    }
}
