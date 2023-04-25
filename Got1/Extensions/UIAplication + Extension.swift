//
//  UIAplication + Extension.swift
//  GotGenerator
//
//  Created by Ульяна Гритчина on 25.04.2023.
//

import SwiftUI

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder),
                   to: nil, from: nil, for: nil)
    }
}
